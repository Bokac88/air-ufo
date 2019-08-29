const initUpdateNavbarOnScroll = () => {
  // check if we are in home page
  if (!document.querySelector('#home-banner')) {
    return;
  }

  const navbar = document.querySelector('.navbar-lewagon');

  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight) {
        navbar.classList.remove('navbar-lewagon-transparent');
      } else {
        navbar.classList.add('navbar-lewagon-transparent');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
