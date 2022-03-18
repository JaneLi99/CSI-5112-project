# CSI 5112 - Software Engineering

A Flutter project of shopping website.

## Our Group Members:
Jiahao Wang </br>
Chenhao Wei </br>
Yue Wan </br>
Wenxin Han </br>
Jiaming Li </br>

## Description: 

Our website is called “LetsGrocery”.  Merchants could view the products, submit orders and track historical orders. We identify two characters in the website: customers who want to buy products and administrators who want to sell the items.  On the website, there are several key pages: Homepage, user register and login page, product detail page, shopping cart page, customer profile page, and administrator profile page. </br>

### Introduction to Web Pages
- Homepage: The homepage website is our main web. It contains the summary of the items and displays the popular or new items of each category that merchants sell, the login or register function for both merchants and customers, and a shopping cart shortcut icon to check what items are in your shopping cart.</br>

- Login/Register Page: Customers and merchants could use email addresses to log in to their accounts. After they log in, the website will go back to the homepage for viewing products. If people are new users, the website could use an email address to register. Our development team will connect to Google sign-in API soon, which supports the google accounts to log in to the website. Besides, if a user is a merchant, he/she could use “administrator login” to navigate to the merchant profile page. </br>

- Shopping Cart Page: The customers can check what they have added to the shopping cart page. It shows the quantity and also the price of each item, the total price of all items, and the payment price which includes the delivery fee as well. The functions of this page include removing the items that you do not want anymore,  incrementing or decrementing the quantity of each item, choosing the different delivery types, and seeing how much you cost on this order.</br>

- Customer Profile Page: There are several functionalities on the page. The customers can track historical orders to navigate to the order detail page. In login, users can go back to the login page for editing. Customers could edit their addresses or manage their payments on the customer profile page. </br>

- Product Detail Page: While the customer browsing the products, if the customer is interested in the product, the customer can click on the item and see the detail of that item. The customer is able to see the big picture, price, introduction of the item, and where the item is from. Also, the customer is able to add the item to his/her shopping cart if he/she wants to buy that item. The customer can go to the shopping cart to see what he/she has right now in the shopping cart by clicking on “My cart”. </br>

- Merchant Page: The website has three main parts. The first part shows three categories and the merchant is able to select each one of them, and then add, edit, or remove the inventory of the items. The second part displays that the merchant can add new items to the web, it could be something new to customers, it could also be something changed. For the third part, the merchant can check the order from customers by clicking on “Recent Order”. The merchant is able to see what products the customer bought, how much the customer paid, and when he/she bought them.</br>

### Page Jumps Diagram
How the several websites jump to each others is shown in the figure below.

![](https://github.com/JaneLi99/CSI-5112-project/blob/main/Navigate_diagram.png)
