// Make all external links (to Medium.com) open in a new tab
document.addEventListener('DOMContentLoaded', function() {
    // Select all links on the page
    var links = document.querySelectorAll('a');
    
    links.forEach(function(link) {
        var href = link.getAttribute('href');
        
        // Check if the link is external (contains medium.com or starts with http/https and not the current domain)
        if (href && (href.includes('medium.com') || 
           (href.startsWith('http') && !href.includes(window.location.hostname)))) {
            link.setAttribute('target', '_blank');
            link.setAttribute('rel', 'noopener noreferrer'); // Security best practice
        }
    });
    
    // Make site name in header clickable and link to homepage
    var headerTitle = document.querySelector('.md-header__title');
    if (headerTitle) {
        // Remove any existing link if present and wrap content
        var existingLink = headerTitle.querySelector('a');
        if (!existingLink) {
            // Make the entire title clickable
            headerTitle.style.cursor = 'pointer';
            headerTitle.addEventListener('click', function(e) {
                e.preventDefault();
                e.stopPropagation();
                window.location.href = '/';
            });
        }
    }
});

// ============================================
// TEXT-TO-SPEECH FEATURE
// ============================================

let listenButton = null;
let isPlaying = false;
let isPaused = false;
let utterance = null;

function initializeTTS() {
    // Only run on article, research, and tools pages
    const isArticleOrResearch = window.location.pathname.includes('/articles/') || 
                                window.location.pathname.includes('/research/') ||
                                window.location.pathname.includes('/developertools/');
    
    if (!isArticleOrResearch) {
        // Clean up if button exists from previous page
        if (listenButton && listenButton.parentElement) {
            listenButton.remove();
            listenButton = null;
        }
        return;
    }

    // Find the main article heading and inject the button
    const articleHeading = document.querySelector('.md-content h1');
    if (!articleHeading) return;

    // Check if button already exists
    if (listenButton && listenButton.parentElement === articleHeading) return;

    // Create button element
    listenButton = document.createElement('button');
    listenButton.id = 'listen-button';
    listenButton.className = 'listen-icon-btn';
    listenButton.setAttribute('aria-label', 'Listen to article');
    listenButton.setAttribute('title', 'Click: Play/Pause | Double-click: Stop');
    listenButton.innerHTML = '<span class="listen-icon">🔊</span>';
    
    // Append to heading
    articleHeading.appendChild(listenButton);

    // Check if browser supports speech synthesis
    if (!('speechSynthesis' in window)) {
        listenButton.style.display = 'none';
        return;
    }

    // Reset state when navigating to new page
    if (window.speechSynthesis.speaking) {
        window.speechSynthesis.cancel();
    }
    isPlaying = false;
    isPaused = false;

    listenButton.addEventListener('click', function(e) {
        e.preventDefault();
        
        if (isPlaying && !isPaused) {
            window.speechSynthesis.pause();
            isPaused = true;
            updateButtonState();
        } else if (isPaused) {
            window.speechSynthesis.resume();
            isPaused = false;
            updateButtonState();
        } else {
            speakPageContent();
        }
    });

    // Double-click to stop completely
    listenButton.addEventListener('dblclick', function(e) {
        e.preventDefault();
        window.speechSynthesis.cancel();
        isPlaying = false;
        isPaused = false;
        updateButtonState();
    });

    function speakPageContent() {
        // Try multiple selectors to find the main content
        const contentElement = document.querySelector('.md-content__inner article') ||
                              document.querySelector('.md-content article') ||
                              document.querySelector('article.md-content__inner') ||
                              document.querySelector('.md-content__inner');
        
        if (!contentElement) {
            console.error('Text-to-speech: Could not find page content');
            alert('Could not find page content to read');
            return;
        }

        // Clone the element to avoid modifying the original
        const clone = contentElement.cloneNode(true);
        
        // Remove code blocks, navigation, and other non-readable elements
        const elementsToRemove = clone.querySelectorAll(
            'pre, code, .md-nav, .md-footer, .md-header, ' +
            '.md-sidebar, script, style, .listen-container, ' +
            '.headerlink, .md-annotation, .md-source-file, ' +
            '.md-content__button, button, nav, aside, ' +
            '.md-typeset__scrollwrap, .md-typeset__table, ' +
            'h1, .admonition-title'
        );
        elementsToRemove.forEach(el => el.remove());

        // Get the text content
        let text = clone.textContent || clone.innerText || '';
        
        // Clean up the text
        text = text
            .replace(/\s+/g, ' ')  // Replace multiple spaces with single space
            .replace(/\n+/g, '. ') // Replace newlines with periods
            .replace(/\.\s*\./g, '.') // Remove double periods
            .trim();

        console.log('Reading text preview:', text.substring(0, 200));

        if (!text) {
            alert('No content to read');
            return;
        }

        // Create utterance
        utterance = new SpeechSynthesisUtterance(text);
        
        // Configure speech
        utterance.rate = 1.0;    // Speed (0.1 to 10)
        utterance.pitch = 1.0;   // Pitch (0 to 2)
        utterance.volume = 1.0;  // Volume (0 to 1)
        
        // Event handlers
        utterance.onstart = function() {
            isPlaying = true;
            updateButtonState();
        };
        
        utterance.onend = function() {
            console.log('TTS: Speech ended');
            isPlaying = false;
            isPaused = false;
            updateButtonState();
        };
        
        utterance.onerror = function(event) {
            // Ignore "interrupted" errors (they're expected when pausing)
            if (event.error !== 'interrupted') {
                console.error('Text-to-speech error:', event.error);
                isPlaying = false;
                isPaused = false;
                updateButtonState();
            }
        };

        // Start speaking
        window.speechSynthesis.speak(utterance);
    }

    function updateButtonState() {
        const icon = listenButton.querySelector('.listen-icon');
        
        if (isPlaying && !isPaused) {
            icon.textContent = '⏸️';
            listenButton.setAttribute('aria-label', 'Pause reading');
            listenButton.classList.add('listening');
        } else if (isPaused) {
            icon.textContent = '▶️';
            listenButton.setAttribute('aria-label', 'Resume reading');
            listenButton.classList.remove('listening');
        } else {
            icon.textContent = '🔊';
            listenButton.setAttribute('aria-label', 'Listen to article');
            listenButton.classList.remove('listening');
        }
    }

    // Clean up when navigating away
    window.addEventListener('beforeunload', function() {
        if (isPlaying) {
            window.speechSynthesis.cancel();
        }
    });
}

// Initialize on page load
document.addEventListener('DOMContentLoaded', initializeTTS);

// Re-initialize on Material navigation (instant loading)
document$.subscribe(function() {
    initializeTTS();
});
