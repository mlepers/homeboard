const changeCategory= () => {
    const demand = document.getElementById('service_category_demand_btn');
    const offer = document.getElementById('service_category_offer_btn');
    console.log(demand);
    console.log(offer);
    if (demand && offer) {
      demand.addEventListener("click", () => {
        demand.classList.toggle("active");
        offer.classList.remove("active");
      })
      offer.addEventListener("click", () => {
        offer.classList.toggle("active");
        demand.classList.remove("active");
      })
    }

  }
  
  export { changeCategory };