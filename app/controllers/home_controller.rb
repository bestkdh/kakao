class HomeController < ApplicationController
  def keyboard
    
 # keyboard = {    "type" => "buttons", "buttons" => ["주사위", "선택 2", "선택 3"] }
 
  keyboard = {    "type" => "text" }
    render json: keyboard
  
  end
  # 로또 (1..45).to_a.sample(6).sort
  def message
    user_message = params[:content]
    
      case user_message
        when "주사위"
  # 로또 (1..45).to_a.sample(6).sort

          return_massage =  [rand(1..6)].sample     #[1,2,3,4,5,6].sample
       when "안녕"
          return_massage = "그래안녕"
       else 
        return_massage = "다른버튼"
      end
    
    keyboard_message = {    "type" => "buttons", "buttons" => ["주사위", "선택 2", "선택 3"] }
    #message = {"message"=>{ "text" => "귀하의 차량이 성공적으로 등록되었습니다. 축하합니다!"}, "keyboard" => keyboard_message }
    message = {"message"=>{ "text" => "#{return_massage}", "photo": {
    "url": "http://file2.instiz.net/data/cached_img/upload/2015/11/25/0/5abb4f59bf04ce60d6a0adef67c43515.jpg",
    "width": 640,
    "height": 480
  }}, "keyboard" => keyboard_message }

    render json: message
    
  end  
  
end
