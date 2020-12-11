layui.use(['form'], function() {
	var form = layui.form;
	var dictionary = parent.layui.dictionary;
	var $ax = parent.layui.ax;
	var $ = layui.$;
	var basePath = $("#path").val();

	console.log("qualitytestorderticket_add.js");
	var orderID = common.getUrlParam("id");

	var myForm = {

	};
	/**
	 * 获取委托单信息
	 * @param {Object} id
	 */
	myForm.getOrderTicketInfo = function(id) {
		var data = null;
		$.ajax({
			type: "GET",
			async: false,
			url: basePath + "/QualityTestOrderTicket/find/" + id + ".do",
			dataType: 'json',
			success: function(msg) {
				data = msg;
				console.log(msg);
			}
		})
		return data;
	}
	/**
	 * 添加试验
	 * @param {Object} id
	 * @param {Object} eId
	 */
	myForm.addExperimental = function(id, eId) {
		$.ajax({
			type: "POST",
			async: false,
			url: basePath + "/QualityTestOrderTicket/addexp/" + id + "/" + eId + ".do",
			dataType: 'json',
			success: function(msg) {
				console.log(msg);
				if (msg.code = 200) {
					parent.layer.closeAll();
				} else {
					layer.alert("添加失败");
				}
			}
		})
	}

	/**
	 * 显示已添加的试验
	 * @param {Object} data
	 */
	myForm.setExperimentalInfo = function(data) {
		if (data['status'] == 1) {
			$("#experimental_info").html(data['requiredExperimenta']);
		} else {
			$("#experimental").html('');
		}
	}
	/**
	 * 显示可选试验列表
	 * @param {Object} data
	 */
	myForm.setExperimentalList = function(data) {
		if (data == null || data.length == 0) {
			$("#add_experimental").html('');
			$("#add_experimental").html('<p>获取数据失败，请重试！</p>');
			form.render();
			return;
		}
		$("#add_experimental").html('');
		var msg = '<div class="layui-form-item layui-row" style="margin-left: 19px;padding-top:5px;">';
		for (var i = 0; i < data.length; i++) {
			if (data[i]['name'].length > 10) {
				msg +=
					'<div class="layui-col-xs12"style="text-align: left;padding-top:10px;">' +
					'<input type="checkbox" name="experimental" value="' + data[i]['id'] + '" title="' + data[i]['name'] + '">' +
					'</div>';
			} else {
				msg +=
					'<div class="layui-col-xs6"style="text-align: left;padding-top:10px;">' +
					'<input type="checkbox" name="experimental" value="' + data[i]['id'] + '" title="' + data[i]['name'] + '">' +
					'</div>';
			}

		}
		msg += '</div>';
		$("#add_experimental").append(msg);
		form.render();
	}
	/**
	 * 试验列表获取错误
	 */
	myForm.setExperimentalNull = function() {
		$("#div_main").html('');
		$("#div_main").html('<p>获取数据失败，请重试！</p>');
		form.render();
	}

	var orderInfo = myForm.getOrderTicketInfo(orderID);

	if (orderInfo != null && orderInfo.code == 200) {
		myForm.setExperimentalInfo(orderInfo.data);

		var mID = orderInfo.data['materials_num'];
		var eData = dictionary.getExperimentalData( mID,basePath);
		myForm.setExperimentalList(eData);

	} else {
		myForm.setExperimentalNull();
	}

	/**
	 * 提交
	 */
	form.on('submit(btnSubmit)', function(data) {
		var checkval = "";
		$('input[name="experimental"]:checked').each(function() {
			checkval += $(this).val() + ",";
		});
		if (checkval == "") {
			layer.alert('请选择试验', {
				title: '警告'
			})
			return false;
		}

		myForm.addExperimental(orderID, checkval);
		return false;
	});

});
