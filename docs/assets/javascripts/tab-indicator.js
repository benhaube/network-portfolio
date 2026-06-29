// 1. Create a global object to give the indicator "memory" across page loads
window.TabIndicatorState = window.TabIndicatorState || {
    lastOffset: null,
    lastWidth: null
};

document$.subscribe(function() {
    const tabsList = document.querySelector('.md-tabs__list');
    
    // Exit if there are no tabs on the page
    if (!tabsList) return;

    // Check for or create the indicator
    let indicator = document.querySelector('.md-tabs__sliding-indicator');
    if (!indicator) {
        indicator = document.createElement('div');
        indicator.classList.add('md-tabs__sliding-indicator');
        tabsList.appendChild(indicator);
    }

    const activeTab = document.querySelector('.md-tabs__item--active');
    
    if (activeTab) {
        const newOffset = activeTab.offsetLeft;
        const newWidth = activeTab.offsetWidth;

        // If we have a stored previous position, snap to it first before sliding
        if (window.TabIndicatorState.lastOffset !== null) {
            
            // Step A: Disable transition to snap instantly to the OLD position
            indicator.style.transition = 'none';
            indicator.style.transform = `translateX(${window.TabIndicatorState.lastOffset}px)`;
            indicator.style.width = `${window.TabIndicatorState.lastWidth}px`;
            indicator.style.opacity = '1';

            // Step B: Force the browser to register this position (forces a reflow)
            void indicator.offsetWidth;

            // Step C: Re-enable the smooth transition and move to the NEW position
            indicator.style.transition = 'all 0.3s cubic-bezier(0.4, 0, 0.2, 1)';
            indicator.style.transform = `translateX(${newOffset}px)`;
            indicator.style.width = `${newWidth}px`;
            
        } else {
            // First time the user loads the site, just appear at the active tab without sliding
            indicator.style.transition = 'none';
            indicator.style.transform = `translateX(${newOffset}px)`;
            indicator.style.width = `${newWidth}px`;
            indicator.style.opacity = '1';
            
            // Turn transitions on shortly after for future clicks
            setTimeout(() => {
                indicator.style.transition = 'all 0.3s cubic-bezier(0.4, 0, 0.2, 1)';
            }, 50);
        }

        // Save this new position to memory for the next click
        window.TabIndicatorState.lastOffset = newOffset;
        window.TabIndicatorState.lastWidth = newWidth;

    } else {
        indicator.style.opacity = '0';
    }

    // Keep it aligned without animating if the user resizes their browser window
    window.addEventListener('resize', () => {
        const currentActive = document.querySelector('.md-tabs__item--active');
        if (currentActive && indicator) {
            indicator.style.transition = 'none';
            indicator.style.transform = `translateX(${currentActive.offsetLeft}px)`;
            indicator.style.width = `${currentActive.offsetWidth}px`;
            
            // Update memory on resize so the next click starts from the correct adjusted spot
            window.TabIndicatorState.lastOffset = currentActive.offsetLeft;
            window.TabIndicatorState.lastWidth = currentActive.offsetWidth;
        }
    });
});