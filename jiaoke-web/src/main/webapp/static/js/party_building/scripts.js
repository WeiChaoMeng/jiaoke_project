'use strict';

(function($){

  $(function() {

      var datascource = {
          'name': '李辉忠',
          'title': '党委书记',
          'children': [
              { 'name': '王玉秋', 'title': '党委副书记', 'className': 'middle-level',
                  'children': [
                      { 'name': '闫宝松', 'title': '一组组长', 'className': 'rd-dept',
                          'children': [
                              { 'name': '李辉中', 'title': '一组组员', 'className': 'product-dept'},
                              { 'name': '李达维', 'title': '一组组员', 'className': 'product-dept' },
                              { 'name': '杨德秀', 'title': '一组组员', 'className': 'product-dept'},
                              { 'name': '王玉秋', 'title': '一组组员', 'className': 'product-dept'},
                              { 'name': '霍士伟', 'title': '一组组员', 'className': 'product-dept'},
                              { 'name': '张永群', 'title': '一组组员', 'className': 'product-dept'},
                              { 'name': '姜兰柱', 'title': '一组组员', 'className': 'product-dept'},
                              { 'name': '汪宁', 'title': '一组组员', 'className': 'product-dept'}
                          ] },
                      { 'name': '沈德才', 'title': '二组组长', 'className': 'rd-dept',
                          'children': [
                              { 'name': '李保奇', 'title': '二组组员', 'className': 'product-dept'},
                              { 'name': '王爱军', 'title': '二组组员', 'className': 'product-dept'},
                              { 'name': '王玉平', 'title': '二组组员', 'className': 'product-dept'},
                              { 'name': '李章', 'title': '二组组员', 'className': 'product-dept'},
                              { 'name': '李传龙', 'title': '二组组员', 'className': 'product-dept'},
                              { 'name': '李树东', 'title': '二组组员', 'className': 'product-dept'},
                              { 'name': '吴热东', 'title': '二组组员', 'className': 'product-dept'},
                              { 'name': '常炜', 'title': '二组组员', 'className': 'product-dept'},
                              { 'name': '梁夏夏', 'title': '二组组员', 'className': 'product-dept'}
                          ]
                      }
                  ]

              }
          ]
      };

    $('#chart-container').orgchart({
      'data' : datascource,
      'nodeContent': 'title'
    });

  });

})(jQuery);