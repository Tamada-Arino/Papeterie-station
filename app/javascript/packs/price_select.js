document.addEventListener('DOMContentLoaded', function() {
  const priceMin = document.querySelector('#price_min');
  const priceMax = document.querySelector('#price_max');

  priceMin.addEventListener('input', function() {
    const min = parseInt(priceMin.value, 10);
    const max = parseInt(priceMax.value, 10);

    if (min > max) {
      priceMax.value = min;
    }
  });

  priceMax.addEventListener('input', function() {
    const min = parseInt(priceMin.value, 10);
    const max = parseInt(priceMax.value, 10);

    if (max < min) {
      priceMin.value = max;
    }
  });
});
