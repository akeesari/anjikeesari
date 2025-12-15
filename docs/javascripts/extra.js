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
});
