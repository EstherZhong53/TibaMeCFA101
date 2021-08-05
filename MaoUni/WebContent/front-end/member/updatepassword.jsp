<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <link rel="preconnect" href="https://fonts.gstatic.com">
 <link href="https://fonts.googleapis.com/css2?family=Convergence&family=Lato:wght@300;400;700;900&family=Mukta:wght@300;400;600;700;800&family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
*,*::before,*::after {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}
body {
  font-family: "Convergence", sans-serif;
  height: 50vh;
  display: grid;
  justify-content: center;
  align-items: center;
  font-size: 0.5rem;
  background-color: white;
}
.form {
  position: relative;
  width: 20rem;
  height: 3rem;
  &__input {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    border: 2px solid $clr-gray300;
    border-radius: $radius;
    font-family: inherit;
    font-size: inherit;
    color: white;
    outline: none;
    padding: 1.25rem;
    background: none;
    &:hover {
      border-color: #FFC78E;
    }
    /* 輸入焦點時更改邊框*/
    &:focus {
      border-color: #FFC78E;
    }
  }
  &__label {
    position: absolute;
    left: 1rem;
    top: 0.8rem;
    padding: 0 0.5rem;
    color: white;
    cursor: text;
    transition: top 200ms ease-in, left 200ms ease-in, font-size 200ms ease-in;
    background-color: #FFC78E;
  }
}
/* 
 
.當輸入處於焦點狀態時
縮小標籤尺寸並向上移動
當內容在輸入字段時保持標籤狀態 
*/
.form__input:focus ~ .form__label,.form__input:not(:placeholder-shown).form__input:not(:focus) ~ .form__label {
  top: -0.5rem;
  font-size: 0.8rem;
  left: 0.8rem;
}
.passwordbutton{
  
 background-color: #FFC78E;  
}
</style>

</head>

<body>

	<div class="form">
		<input type="text" id="email" class="form__input" autocomplete="off" placeholder=" ">
    <label for="email" class="form__label">舊密碼</label>
  </div>
  
  <div class="form">
    <input type="text" id="email" class="form__input" autocomplete="off" placeholder=" ">
    <label for="email" class="form__label">新密碼</label>
  </div>
  
    <div class="form">
    <input type="text" id="email" class="form__input" autocomplete="off" placeholder=" ">
    <label for="email" class="form__label">再輸入一次新密碼</label>   
      
  </div>
   
<button>Button</a>


</body>
</html>