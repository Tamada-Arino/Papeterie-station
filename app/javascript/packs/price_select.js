document.addEventListener('DOMContentLoaded', function() {
  const priceMin = document.querySelector('#price_min');
  const priceMax = document.querySelector('#price_max');

  priceMin.addEventListener('input', function() {
    const min = parseInt(priceMin.value);
    const max = parseInt(priceMax.value);

    if (min > max) {
      priceMax.value = min;
    }
  });

  priceMax.addEventListener('input', function() {
    const min = parseInt(priceMin.value);
    const max = parseInt(priceMax.value);

    if (max < min) {
      priceMin.value = max;
    }
  });
});
