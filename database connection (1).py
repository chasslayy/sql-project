from flask import Flask, render_template, request, jsonify
import mysql.connector

app = Flask(__name__)

# Database connection
db = mysql.connector.connect(
    host="localhost",
    user="your_username",
    password="your_password",
    database="shopease_db"
)

@app.route('/')
def index():
    return "Welcome to JIMMC!"

@app.route('/products')
def products():
    cursor = db.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Product")
    products = cursor.fetchall()
    return render_template('products.html', products=products)

@app.route('/add_order', methods=['POST'])
def add_order():
    data = request.get_json()
    cursor = db.cursor()
    query = "INSERT INTO `Order` (Customer_ID, Date, Delivery_Address, Status, Total_Cost) VALUES (%s, %s, %s, %s, %s)"
    cursor.execute(query, (data['customer_id'], data['date'], data['delivery_address'], data['status'], data['total_cost']))
    db.commit()
    return jsonify({'message': 'Order added successfully!'})
