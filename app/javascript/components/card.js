const initUpdateCardOnHover = () => {
  let cards = document.querySelectorAll(".index-card");
  // This handler will be executed every time the cursor
  // is moved over a different list item
  cards.forEach( card => {
    card.addEventListener("mouseover", function (event) {
      // highlight the mouseover target
      event.currentTarget.classList.toggle("shadow");
    }, false);
  })
}

export { initUpdateCardOnHover };
