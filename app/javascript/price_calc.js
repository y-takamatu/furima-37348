window.addEventListener('load',() =>{
  const inputPrice = document.getElementById("item-price");
  const calcTax = document.getElementById("add-tax-price");
  const calkProfit = document.getElementById("profit");
  inputPrice.addEventListener("input",() => {
    const inputValue = inputPrice.value;
    const addTaxValue = Math.floor(inputValue * 0.1)
    calcTax.innerHTML = addTaxValue
    calkProfit.innerHTML = Math.floor(inputValue - addTaxValue)
  });
});