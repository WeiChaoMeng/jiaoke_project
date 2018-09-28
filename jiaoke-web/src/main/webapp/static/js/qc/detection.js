window.onload() = () => {

}


function detection_start (obj){
   switch(obj){
       case 'detection_start':
           $('.div_munu').attr('style' ,'z-index = 1' )
           $('#menu_one').attr('style', 'z-index = 100')
            break;

       case 'history_result':
       break;

       case 'meta_analysis':
       break;

       default:
       return false;
   }
}

function test_fn(obj){
    switch(obj){
        case 'material_1':
            $('.div_munu').attr('style', 'z-index = 1;display: none;');
            $('.div_munu_detection').attr('style', 'z-index = 1;display: none;');
            $('#test_material_one').attr('style', 'z-index = 100');
            break;
        case 'material_2':
            $('.div_munu').attr('style', 'z-index = 1;display: none;');
            $('.div_munu_detection').attr('style', 'z-index = 1;display: none;');
            $('#test_material_two').attr('style', 'z-index = 100');
            break;
        case 'material_3':
            $('.div_munu').attr('style', 'z-index = 1;display: none;');
            $('.div_munu_detection').attr('style', 'z-index = 1;display: none;');
            $('#test_material_three').attr('style', 'z-index = 100');
            break;
        case 'material_4':
            $('.div_munu').attr('style', 'z-index = 1;display: none;');
            $('.div_munu_detection').attr('style', 'z-index = 1;display: none;');
            $('#test_material_four').attr('style', 'z-index = 100');
            break;
        case 'material_5':
            $('.div_munu').attr('style', 'z-index = 1;display: none;');
            $('.div_munu_detection').attr('style', 'z-index = 1;display: none;');
            $('#test_material_five').attr('style', 'z-index = 100');
            break;
        case 'material_6':
            $('.div_munu').attr('style', 'z-index = 1;display: none;');
            $('.div_munu_detection').attr('style', 'z-index = 1;display: none;');
            $('#test_material_six').attr('style', 'z-index = 100');
            break;
        case 'material_7':
            $('.div_munu').attr('style', 'z-index = 1;display: none;');
            $('.div_munu_detection').attr('style', 'z-index = 1;display: none;');
            $('#test_material_seven').attr('style', 'z-index = 100');
            break;
        default:
            return false;
    }
}