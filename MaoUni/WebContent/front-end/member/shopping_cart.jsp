<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
</head>
<body>

</body>
</html>













  <?php
 
//Use redis to implement a shopping cart function
class Cart
{
 
    /**
           * Shopping cart has functions: 1. Add goods to the shopping cart 2. Change the number of goods in the shopping cart 3. Display the shopping cart information
     *
     *
           * The functional analysis of adding goods to the shopping cart is as follows:
           * 1. Received product ID
           * 2. Query product information based on product ID
           * 3. Add product information to the shopping cart
     *
           * a. Determine whether the shopping cart has corresponding products
           * b. If there is no corresponding product in the shopping cart, add it directly
           * c. If there are corresponding products in the shopping cart, just modify the number of products
     */
 
    public function __construct()
    {
                 //If the member attribute is not declared, the default is a public attribute
        $this->redis = new Redis;
        $this->redis->connect('127.0.0.1', 6379);
    }
 
    public function addToCart($gid, $cartNum=1)
    {
 
        session_start();
        if ($gid <= 0) {
 
                         throw new Exception("Please enter product ID");
 
        }
 
                 //Query product data based on product ID
        $goodData = $this->goodsData($gid);
 
                 $key ='cart:'.session_id().':'.$gid;//id Description: 1. Not only to distinguish products 2, users
 
        // $data = $this->redis->hget($key, 'id');
        $data = $this->redis->exists($key);
 
 
                 //Determine if there are any items in the shopping cart, and then add to the shopping cart
        if (!$data) {
 
                         //There is no corresponding product before the shopping cart
 
                         //The number of items in the shopping cart
            $goodData['num'] = $cartNum;
 
                         //Have product data in redis hash
            $this->redis->hmset($key, $goodData);
 
 
            $key1 = 'cart:ids:set:'.session_id();
 
                         //Storing the product ID in the collection is to better traverse the products in the user's shopping cart
            $this->redis->sadd($key1, $gid);
 
        } else {
 
                         //The shopping cart has corresponding products, only need to add the number of corresponding products
            $originNum = $this->redis->hget($key, 'num');
 
                         //The original number plus the number of new users added
            $newNum = $originNum + $cartNum;
 
            $this->redis->hset($key, 'num', $newNum);
 
 
        }
 
    }
 
         //Show all products in user's shopping cart
    public function showCartList()
    {
 
        session_start();
 
        $sessId = session_id();
 
 
        $key = 'cart:ids:set:'.session_id();
 
                 //First get the product ID according to the collection
        $idArr =  $this->redis->sMembers($key);
 
 
        for ($i=0; $i<count($idArr); $i++) {
 
            $k  = 'cart:'.session_id().':'.$idArr[$i];//id 
 
            // echo $k,'<br/>';
            $list[] = $this->redis->hGetAll($k);
        }
 
        include './View/show.php';
 
    }
 
    public function goodsData($gid)
    {
 
        $goodsData = array(
 
            1 => array(
                'id' => 1,
                'gname' => 'xxoo',
                'price' => '1.5'
            ),
 
            2 => array(
                'id' => 2,
                'gname' => 'xxoo22',
                'price' => '221.5'
            ),
            3 => array(
                'id' => 3,
                'gname' => 'xxoo33',
                'price' => '331.5'
            ),
            4 => array(
                'id' => 4,
                'gname' => 'xxoo44',
                'price' => '4441.5'
            ),    
        );
 
        return $goodsData[$gid];
    }
}