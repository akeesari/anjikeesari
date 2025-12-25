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
                window.location.href = '/anjikeesari/';
            });
        }
    }
});
