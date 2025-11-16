import "./bootstrap";
import "flowbite";
import Alpine from "alpinejs";
import ApexCharts from "apexcharts";
import swal from "sweetalert2";

// AGGRESSIVELY REMOVE ALL SERVICE WORKERS - CRITICAL FOR LIVEWIRE TO WORK
if ('serviceWorker' in navigator) {
    // Unregister all existing service workers
    navigator.serviceWorker.getRegistrations().then(function(registrations) {
        for(let registration of registrations) {
            registration.unregister();
            console.log('Service Worker unregistered:', registration);
        }
    });
    
    // Also try to unregister by scope
    navigator.serviceWorker.getRegistration().then(function(registration) {
        if (registration) {
            registration.unregister();
            console.log('Service Worker unregistered by scope:', registration);
        }
    });
}

// Set global variables
window.Swal = swal;
window.ApexCharts = ApexCharts;

// Initialize Alpine.js - PREVENT MULTIPLE INSTANCES
if (!window.Alpine) {
    window.Alpine = Alpine;
    console.log('Alpine.js assigned to window');
} else {
    console.log('Alpine.js already exists on window');
}

// Check localStorage immediately to set initial state
if (localStorage.getItem("menu-collapsed") === "true") {
    document.documentElement.classList.add('menu-collapsed');
}

// Initialize Alpine.js when DOM is ready - PREVENT MULTIPLE STARTS
let alpineStarted = false;
document.addEventListener('DOMContentLoaded', () => {
    if (!alpineStarted && !document.querySelector('[x-data]')) {
        Alpine.start();
        alpineStarted = true;
        console.log('Alpine.js initialized on DOMContentLoaded');
    } else if (alpineStarted) {
        console.log('Alpine.js already started, skipping');
    } else {
        console.log('Alpine.js already running, skipping');
    }
});

// Livewire event handlers - these are CRITICAL for Livewire to work
document.addEventListener("livewire:navigating", () => {
    initFlowbite();
});

document.addEventListener("livewire:navigated", () => {
    initFlowbite();
    // Re-initialize mobile sidebar toggle after navigation
    initMobileSidebarToggle();
    // Update theme icons after navigation
    updateThemeIcons();
});

document.addEventListener("livewire:load", () => {
    console.log('Livewire loaded and ready');
    // Remove the loading state class to allow user interaction
    document.body.classList.remove('livewire-loading');
});

// Initialize Flowbite components with better error handling
function initFlowbite() {
    try {
        if (typeof window.initFlowbite === 'function') {
            window.initFlowbite();
            console.log('Flowbite initialized');
        } else if (typeof window.FlowbiteInstances !== 'undefined') {
            // Alternative initialization method
            console.log('Flowbite instances found, using alternative init');
        } else {
            console.log('Flowbite not available');
        }
    } catch (error) {
        console.error('Error initializing Flowbite:', error);
    }
}

// Initialize mobile sidebar toggle functionality
function initMobileSidebarToggle() {
    // Mobile sidebar toggle (for show/hide on mobile)
    const mobileSidebarToggle = document.getElementById('toggleSidebarMobile');
    if (mobileSidebarToggle) {
        // Remove any existing event listeners to prevent duplicates
        mobileSidebarToggle.replaceWith(mobileSidebarToggle.cloneNode(true));
        const newMobileSidebarToggle = document.getElementById('toggleSidebarMobile');
        
        newMobileSidebarToggle.addEventListener('click', () => {
            const sidebar = document.getElementById('sidebar');
            const hamburgerIcon = document.getElementById('toggleSidebarMobileHamburger');
            const closeIcon = document.getElementById('toggleSidebarMobileClose');
            const backdrop = document.getElementById('sidebarBackdrop');
            
            if (sidebar) {
                const isHidden = sidebar.classList.contains('hidden');
                
                if (isHidden) {
                    // Show sidebar
                    sidebar.classList.remove('hidden');
                    sidebar.classList.add('flex');
                    if (hamburgerIcon) hamburgerIcon.classList.add('hidden');
                    if (closeIcon) closeIcon.classList.remove('hidden');
                    if (backdrop) backdrop.classList.remove('hidden');
                } else {
                    // Hide sidebar
                    sidebar.classList.add('hidden');
                    sidebar.classList.remove('flex');
                    if (hamburgerIcon) hamburgerIcon.classList.remove('hidden');
                    if (closeIcon) closeIcon.classList.add('hidden');
                    if (backdrop) backdrop.classList.add('hidden');
                }
            }
        });
        console.log('Mobile sidebar toggle initialized');
    }

    // Close sidebar when clicking backdrop
    const backdrop = document.getElementById('sidebarBackdrop');
    if (backdrop) {
        // Remove any existing event listeners to prevent duplicates
        backdrop.replaceWith(backdrop.cloneNode(true));
        const newBackdrop = document.getElementById('sidebarBackdrop');
        
        newBackdrop.addEventListener('click', () => {
            const sidebar = document.getElementById('sidebar');
            const hamburgerIcon = document.getElementById('toggleSidebarMobileHamburger');
            const closeIcon = document.getElementById('toggleSidebarMobileClose');
            
            if (sidebar) {
                sidebar.classList.add('hidden');
                sidebar.classList.remove('flex');
                if (hamburgerIcon) hamburgerIcon.classList.remove('hidden');
                if (closeIcon) closeIcon.classList.add('hidden');
                newBackdrop.classList.add('hidden');
            }
        });
        console.log('Mobile sidebar backdrop initialized');
    }
}

// Initialize Flowbite on page load
document.addEventListener('DOMContentLoaded', () => {
    initFlowbite();
    initMobileSidebarToggle();
});

// Handle theme toggle
document.addEventListener('DOMContentLoaded', () => {
    const themeToggle = document.getElementById('theme-toggle');
    if (themeToggle) {
        // Initialize theme icons on page load
        updateThemeIcons();
        
        themeToggle.addEventListener('click', () => {
            const html = document.documentElement;
            if (html.classList.contains('dark')) {
                html.classList.remove('dark');
                localStorage.setItem('theme', 'light');
            } else {
                html.classList.add('dark');
                localStorage.setItem('theme', 'dark');
            }
            // Update icons after toggle
            updateThemeIcons();
        });
    }
});

// Function to update theme toggle icons
function updateThemeIcons() {
    const darkIcon = document.getElementById('theme-toggle-dark-icon');
    const lightIcon = document.getElementById('theme-toggle-light-icon');
    const html = document.documentElement;
    
    if (darkIcon && lightIcon) {
        if (html.classList.contains('dark')) {
            // Dark mode is active, show light icon (sun)
            darkIcon.classList.add('hidden');
            lightIcon.classList.remove('hidden');
        } else {
            // Light mode is active, show dark icon (moon)
            darkIcon.classList.remove('hidden');
            lightIcon.classList.add('hidden');
        }
    }
}

// Handle desktop sidebar toggle
document.addEventListener('DOMContentLoaded', () => {
    // Desktop sidebar toggle (for menu collapse/expand)
    const sidebarToggle = document.getElementById('toggle-sidebar');
    if (sidebarToggle) {
        sidebarToggle.addEventListener('click', () => {
            const html = document.documentElement;
            const isCollapsed = html.classList.contains('menu-collapsed');
            
            if (isCollapsed) {
                html.classList.remove('menu-collapsed');
                localStorage.setItem('menu-collapsed', 'false');
            } else {
                html.classList.add('menu-collapsed');
                localStorage.setItem('menu-collapsed', 'true');
            }
        });
    }
});

