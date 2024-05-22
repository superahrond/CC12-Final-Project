<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>POS System</title>
    <link rel="stylesheet" href="Restaurantdesign.css">
</head>
<body>
    <h1>Restaurant POS System</h1>
    <div class="container">
        <div class="product-list">
            <h2>Menu</h2>
            <ul id="product-list">
                <!-- Product items will be added dynamically here -->
            </ul>
        </div>
        <div class="cart">
            <h2>Cart</h2>
            <ul id="cart-list">
                <!-- Cart items will be added dynamically here -->
            </ul>
            <p id="total">Total: $0.00</p>
            <button id="checkout">Checkout</button>
        </div>
    </div>

    <script>
        // Paste your JavaScript code here
        <%-- products data --%>
        const products = [
            { id: 1, name: 'Burger', price: 10.99, image: 'burger.jpg' },
            { id: 2, name: 'Pizza', price: 15.99, image: 'pizza.jpg' },
            { id: 3, name: 'Spaghetti', price: 10.99, image: 'spaghetti.jpg' },
            { id: 4, name: 'Fries', price: 7.99, image: 'fries.jpg' },
            { id: 5, name: 'Coke', price: 5.99, image: 'coke.jpg' },
            { id: 6, name: 'Chicken', price: 12.99, image: 'chicken.jpg' }
            // add more products here
        ];

        <%-- cart data --%>
        let cart = [];

        <%-- render products list --%>
        const productList = document.getElementById('product-list');
        products.forEach((product) => {
            const listItem = document.createElement('LI');
            listItem.innerHTML = `
                <h2>${product.name}</h2>
                <img src="${product.image}">
                <!-- other product details -->
            `;
            listItem.dataset.productId = product.id;
            productList.appendChild(listItem);
        });

        <%-- add event listener to products list --%>
        productList.addEventListener('click', (e) => {
            if (e.target.tagName === 'LI') {
                const productId = e.target.dataset.productId;
                const product = products.find((p) => p.id === parseInt(productId));
                addProductToCart(product);
            }
        });

        <%-- add product to cart --%>
        function addProductToCart(product) {
            const cartItem = cart.find((item) => item.id === product.id);
            if (cartItem) {
                cartItem.quantity++;
            } else {
                cart.push({ id: product.id, name: product.name, price: product.price, quantity: 1 });
            }
            updateCart();
        }

        <%-- update cart --%>
        function updateCart() {
            const cartList = document.getElementById('cart-list');
            cartList.innerHTML = '';
            cart.forEach((item) => {
                const listItem = document.createElement('li');
                const img = document.createElement('img');
                img.src = item.image;
                img.alt = item.name;
                listItem.appendChild(img);
                const cartItemText = document.createElement('span');
                cartItemText.textContent = `${item.name} x ${item.quantity} - $${item.price * item.quantity}`;
                listItem.appendChild(cartItemText);

                const deleteButton = document.createElement('button');
                deleteButton.textContent = 'Delete';
                deleteButton.addEventListener('click', () => {
                    cart = cart.filter((cartItem) => cartItem.id !== item.id);
                    updateCart();
                });
                listItem.appendChild(deleteButton);
                cartList.appendChild(listItem);
            });

            const total = cart.reduce((acc, item) => acc + item.price * item.quantity, 0);
            document.getElementById('total').textContent = `Total: $${total.toFixed(2)}`;
        }

        <%-- checkout --%>
        document.getElementById('checkout').addEventListener('click', () => {
            // send cart data to server to process payment
            console.log('Checkout clicked!');
            // TO DO: implement payment processing logic here
        });
    </script>
</body>
</html>
