/**
 * Created by mac on 17/7/3.
 */
// $('#menu-bar li').on('click',function () {
//     var _that = $(this).find('span');
//     $('#menu-bar li').find('span').removeClass('active');
//     _that.addClass('active');
// })

/*获取并显示当前日期时间和星期*/
function showTime(){
    var show_day=new Array('星期日','星期一','星期二','星期三','星期四','星期五','星期六');
    var time=new Date();
    var year=time.getFullYear();
    var month=time.getMonth()+1;
    var date=time.getDate();
    var day=time.getDay();
    var hour=time.getHours();
    var minutes=time.getMinutes();
    var second=time.getSeconds();
    /*  month<10?month='0'+month:month;  */
    hour<10?hour='0'+hour:hour;
    minutes<10?minutes='0'+minutes:minutes;
    second<10?second='0'+second:second;
    var now_date=year+'年'+month+'月'+date+'日'+' '+show_day[day];
    var new_time= hour+":"+minutes+":"+second+"";
    document.getElementById("head-time").innerHTML=new_time;
    document.getElementById('head-date').innerHTML=now_date;
    //时时更新
    setTimeout("showTime();",1000);
}
showTime();
// window.onload=showTime;