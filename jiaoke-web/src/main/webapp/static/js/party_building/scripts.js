'use strict';

(function($){

  $(function() {

      var datascource = {
          'name': '李辉中',
          'title': '党委书记',
          'className': 'motherC',
          'children': [
              { 'name': '王玉秋', 'title': '党委副书记', 'className': 'motherC',
                  'children': [
                      { 'name': '闫宝松', 'title': '一组组长',  'className': 'childC',
                          'children': [
                              { 'name': '<br>李<br>辉<br>中', 'rate': '100%', 'className': 'leafC'},
                              { 'name': '<br>李<br>达<br>维',  'rate': '100%', 'className': 'leafC' },
                              { 'name': '<br>杨<br>德<br>秀',  'rate': '100%', 'className': 'leafC'},
                              { 'name': '<br>王<br>玉<br>秋',  'rate': '100%', 'className': 'leafC'},
                              { 'name': '<br>霍<br>士<br>伟',  'rate': '100%', 'className': 'leafC'},
                              { 'name': '<br>张<br>永<br>群',  'rate': '100%', 'className': 'leafC'},
                              { 'name': '<br>姜<br>兰<br>柱',  'rate': '100%', 'className': 'leafC'},
                              { 'name': '<br>汪<br>宁',    'rate': '100%', 'className': 'leafC'}
                          ] },
                      { 'name': '沈德才', 'title': '二组组长', 'className': 'childC',
                          'children': [
                              { 'name': '<br>李<br>保<br>奇', 'rate': '100%', 'className': 'leafC'},
                              { 'name': '<br>王<br>爱<br>军', 'rate': '100%',  'className': 'leafC'},
                              { 'name': '<br>王<br>玉<br>平',  'rate': '100%', 'className': 'leafC'},
                              { 'name': '<br>李<br>章',  'rate': '100%', 'className': 'leafC'},
                              { 'name': '<br>李<br>传<br>龙', 'rate': '100%', 'className': 'leafC'},
                              { 'name': '<br>李<br>树<br>东', 'rate': '100%', 'className': 'leafC'},
                              { 'name': '<br>吴<br>热<br>东', 'rate': '100%',  'className': 'leafC'},
                              { 'name': '<br>常<br>炜', 'rate': '100%', 'className': 'leafC'},
                              { 'name': '<br>梁<br>夏<br>夏', 'rate': '100%',  'className': 'leafC'}
                          ]
                      }
                  ]

              }
          ]
      };


      var oc = $('#chart-container').orgchart({
      'data' : datascource,
          'nodeContent': 'title', //内容对应的字段
          'toggleSiblingsResp': false

    });

  });

})(jQuery);