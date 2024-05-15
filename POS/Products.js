// Sample product data
const productsData = [
  { id: 1, name: 'Pizza', price: 150 },
  { id: 2, name: 'Burger', price: 69 },
  { id: 3, name: 'Salad', price: 83 },
  { id: 4, name: 'Pasta', price: 160 },
  { id: 5, name: 'Soda', price: 60 }
];

// Add products to the menu
const productContainer = document.getElementById('menu-item');
productsData.forEach(product => {
  const productItem = document.createElement('li');
  productItem.innerHTML = `<button class="add-to-cart" data-id="${product.id}">${product.name} - $${product.price.toFixed(2)}</button>`;
  productContainer.appendChild(productItem);
});

// Add event listener to add products to the cart
document.body.addEventListener('click', (event) => {
  if (event.target.matches('.add-to-cart')) {
    const productId = event.target.dataset.id;
    const product = productsData.find(product => product.id === parseInt(productId));
    addToCart(product);
  }
});

// Function to add product to the cart
function addToCart(product) {
  // Implement the addToCart function here
}