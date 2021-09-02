window.addEventListener("load", () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const fee = document.getElementById("add-tax-price");
    feemax = inputValue * 0.1
    fee.innerHTML = Math.floor(feemax)
    console.log(fee.innerHTML);
      const profit = document.getElementById("profit");
      profitmax = inputValue - feemax
      profit.innerHTML = Math.ceil(profitmax)
  })
})