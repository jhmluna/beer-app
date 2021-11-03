import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Indian Pale Ale", "Lager", "Stout", "Witbeer", "American Pale Ale"],
    typeSpeed: 35,
    loop: true
  });
}

export { loadDynamicBannerText };
