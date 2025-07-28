Question 1
Finish Task 2 from the lesson.
# Create the Spring 2026 trimester once before the loop
spring_2026 = Trimester.create(term: 'Spring', year: '2026')

# Loop through all CodingClasses, print their name, and create a Course for each
CodingClass.all.each do |cc|
  puts cc.name
  Course.create(coding_class: cc, trimester: spring_2026)
end

# How to delete a Course if created by mistake

course_to_delete = Course.find(id: 22)
course_to_delete.destroy

Or

course_to_delete = Course.last
course_to_delete.destroy

Question 2
# Step 1: Find the Spring 2026 trimester
spring_2026 = Trimester.find_by(term: 'Spring', year: '2026')

# Step 2: Find the Intro to Programming course in Spring 2026
intro_course = Course.find_by(trimester: spring_2026, coding_class: CodingClass.find_by(name: 'Intro to Programming'))

# Step 3: Create a new student
new_student = Student.create(
  first_name: 'Poonam',
  last_name: 'Shrestha',
  email: 'Poonam.Shrestha@example.com'
)

# Step 4: Enroll the student in the course
new_enrollment = Enrollment.create(
  student: new_student,
  course: intro_course
)

# Step 5: Find a mentor with 2 or fewer assignments
mentor = Mentor.all.find do |m|
  m.mentor_enrollment_assignments.size <= 2
end

# Step 6: Assign the mentor to the new enrollment
MentorEnrollmentAssignment.create(mentor: mentor, enrollment: new_enrollment)


Question 3 - Describe your project
Designing the data model for my Project!
# who are the users? 
1)Sellers
2)Buyers
3)Administartors
4)Moderators

#Core Features / User Scenarios

1)A user can sign up and log in to their account.
2)A seller can create, update, and delete product listings.
3)A buyer can browse products by category or search.
4)A buyer can add products to their shopping cart.
5)A buyer can review their cart and place an order for items in the cart.
6)The system processes payment transactions securely during checkout.
7)A user can view their order history, including order details and payment status.
8)A buyer can leave reviews for products they’ve purchased.
9)A seller can view orders placed on their products.
10)An admin (optional role) can manage users, products, and oversee transactions.

#Application Flows 

1)Selling a product
A user signs in → navigates to “My Products” → clicks “Add Product” → fills out product details form → submits → product is saved → product appears in public listings for buyers to see.

2)Buying a product (Shopping Cart + Payment)
A user browses products → adds desired products to their shopping cart → reviews cart contents → proceeds to checkout → enters shipping and payment information → system processes payment transaction securely → places order → order confirmation page appears with summary and receipt.

3)Leaving a review
A buyer signs in → views their order history → selects a purchased product → clicks “Leave a Review” → submits star rating and comment → review is saved and displayed on the product page.

#Wireframes 

1.Home Page
 -Search bar
 -Product categories
 -Featured products
2.Product Listing Page
 -List of products with images, prices, and short descriptions
 -Filters and sorting options
3.Product Detail Page
 -Product images
 -Description, price, seller info
 -Add to cart button
 -Reviews and ratings section
4.Shopping Cart Page
 -List of items added to cart
 -Quantity controls
 -Checkout button
5.Checkout Page
 -Shipping info form
 -Payment method form
 -Order summary
6.User Account Page
 -Order history
 -Profile info
 -Saved products or wishlists
7.Seller Dashboard
 -Manage products (create, update, delete)
 -View orders and sales stats

 Question 4 - Design the data model for your project
 
#attributes/columns for each main noun (table/model) 
1. User
  Attributes (columns) :id ,first_name,last_name,email,password,created_at, updated_at (timestamps)
2. Product
 Attributes (columns) :id ,title,description,price,stock_quantity,category_id,user_id,created_at, updated_at (timestamps)
3. Category
Attributes (columns) :id ,name ,description,created_at, updated_at (timestamps)
4. Order
Attributes (columns) :id ,user_id (buyer who placed the order),total_price (decimal),status—"pending", "completed", "shipped",payment_transaction_id,,shipping_address_id (foreign key),created_at, updated_at
5. OrderItem
Attributes:id,order_id,product_id,quantity (integer),price_at_purchase (decimal),created_at, updated_at
6. Cart
Attributes:id,user_id (the owner of the cart),created_at, updated_at
7. CartItem
Attributes:id,cart_id,product_id,quantity (integer),created_at, updated_at
8. Review
Attributes:id,user_id (the reviewer/buyer),product_id,rating (integer, e.g., 1 to 5 stars),comment (text),created_at, updated_at
9. PaymentTransaction
Attributes:id,order_id,payment_method (string, e.g., credit card, PayPal),amount (decimal),status-"pending", "completed", "failed"),transaction_date (datetime),created_at, updated_at
10.ShippingAddress
Attributes:id,user_id,order_id,address_line1,address_line2,city,state,postal_code,country,created_at, updated_at

#ERD:

#Tables and Columns:

Users
- id
- first_name
- last_name
- email
- password_digest
- role (e.g. buyer, seller, admin)
- created_at
- updated_at

Products
- id
- user_id (seller)
- name
- description
- price
- stock_quantity
- created_at
- updated_at

Orders
- id
- user_id (buyer)
- total_price
- status (pending, shipped, delivered, cancelled)
- created_at
- updated_at

OrderItems
- id
- order_id
- product_id
- quantity
- unit_price
- created_at
- updated_at

Reviews
- id
- product_id
- user_id (buyer)
- rating (1-5)
- comment
- created_at
- updated_at

Categories
- id
- name
- created_at
- updated_at

ProductCategories (join table)
- id
- product_id
- category_id
- created_at
- updated_at

Associations:
•User has_many Products
•User has_many Orders
•Order has_many OrderItems
•Product has_many Reviews
•Product has_many ProductCategories
•Category has_many ProductCategories
•ProductCategory belongs_to Product and Category