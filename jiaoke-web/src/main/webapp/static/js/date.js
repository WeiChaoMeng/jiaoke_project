 $(function(){         
    var cells = document.getElementById('monitor').getElementsByTagName('button');
    var day1 = document.getElementById('curday');
    var day7 = document.getElementById('curday7');
    var clen = cells.length;
    var currentFirstDate;
    var myDate=new Date();
        today=myDate.getDate();//获取当前日期

    var formatDate = function(date){             
        var year = date.getFullYear()+'年';
        var month = (date.getMonth()+1)+'月';
        var day = date.getDate();
        var week = '('+['星期天','星期一','星期二','星期三','星期四','星期五','星期六'][date.getDay()]+')';  

        return day;
    };

    var addDate= function(date,n){       
        date.setDate(date.getDate()+n);        
        return date;
    };
    var setDate = function(date){             
        var week = date.getDay();
        date = addDate(date,week*-1);
        currentFirstDate = new Date(date);
      
        for(var i = 0;i<clen;i++){                 
            cells[i].innerHTML = formatDate(i==0 ? date : addDate(date,1));
            if (cells[i].innerHTML==today) {
                cells[i].className='mark1';
            };

            day1.innerHTML=date.getFullYear()+'年'+ (date.getMonth()+1)+'月'+cells[0].innerHTML+'日';
            day7.innerHTML=date.getFullYear()+'年'+ (date.getMonth()+1)+'月'+cells[6].innerHTML+'日';
        }
           
    };

    document.getElementById('last-week').onclick = function(){
        setDate(addDate(currentFirstDate,-7));         
    };             
    document.getElementById('next-week').onclick = function(){                 
        setDate(addDate(currentFirstDate,7));
    };
    document.getElementById('lastM').onclick = function(){
        setDate(addDate(currentFirstDate,-30));         
    };             
    document.getElementById('nextM').onclick = function(){                 
        setDate(addDate(currentFirstDate,30));
    };
    setDate(new Date());

});
