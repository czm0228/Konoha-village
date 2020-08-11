require.config(requireConfig);

require(['jquery', 'flyui', 'datePicker', 'utils', 'dao'], function(jquery) {
    var noticeManageData = [],
        pageNum, currentPage = 1,
        pages,
        totalPage;

    var noticeManage = {
        render: {
            /**
             * [getNoticeManageDownData 获取下拉框的数据]
             * @return {[type]} [description]
             */
            getNoticeManageDownData: function() {
                var noticeStatusDownData = [];
                $.when(dao.getData('../json/down-data-notice-manage.json?id=1')).done(function(data) {
                    noticeStatusDownData = data.data;
                });
                return noticeStatusDownData;
            },
            /**
             * [getNoticeManageTableData 获取表格数据]
             * @return {[type]} [description]
             */
            getNoticeManageTableData: function() {
                noticeManageData = [];
                $.when(dao.getData('../json/list-data-notice-manage.json?id=1')).done(function(data) {
                    noticeManageData = data.data;
                });
                return noticeManageData;
            }
        },
        /**
         * [_addEvent 事件绑定]
         */
        _addEvent: function() {
            noticeManage._eventController.renderNoticeManageDown();
            noticeManage._eventController.renderNoticeManageTable();
            // tab绑定事件,取消、返回绑定事件
            $('#noticeManageSearchTab,#notiManageSearchBackBtn,#notiManageCancel').click(function() {
                $('#noticeManageContainer>div').addClass('hide');
                $('.notice-manage-default-div').removeClass('hide');
            });
            $('#noticeManagePublishTab').click(function() {
                $('#noticeManageContainer>div').addClass('hide');
                $('#publishNoticeManageTableDataId').val('');
                $('#publishNoticeManageTableTitle').val('');
                $('#publishNoticeManageTableText').text('');
                $('.notice-manage-publish-div').removeClass('hide');
            });
            // table按钮绑定事件
            $(document).on('click', '.notice-manage-look-btn', function() {
                noticeManage._eventController.lookNoticeManageList($(this));
                $('.information-submit-position').text('当前位置：首页->通知公告');
            });
            $(document).on('click', '.notice-manage-publish-btn', function() {
                noticeManage._eventController.publishNoticeManageList($(this));
                $('.information-submit-position').text('当前位置：首页->公告发布');
            });
            $(document).on('click', '.notice-manage-delete-btn', function() {
                noticeManage._eventController.deleteNoticeManageList($(this));
            });
            // 查询按钮绑定事件
            $('.noticeManage-searchBtn').on('click', noticeManage._eventController.searchNoticeManageList);
            // 暂存按钮绑定事件
            $('#notiManageScratch').click(function() {
                noticeManage._eventController.scratchNoticeManageList();
            });
            // 发布按钮绑定事件
            $('#notiManagePublish').click(function() {
                noticeManage._eventController.publishBtnNoticeManageList();
            });
            //获取当前的pageNum与currentPage
            $('#noticeManageTablePages').delegate('a', 'mouseup', function(){
                thisTxt=$(this).text();
                noticeManage._eventController.getPageInfo(thisTxt,pages);
            });
        },
        /**
         * [_eventController 事件处理]
         * @type {Object}
         */
        _eventController: {
            /**
             * [renderNoticeManageDown 渲染下拉列表]
             * @return {[type]} [description]
             */
            renderNoticeManageDown: function() {
                var statusDownData = noticeManage.render.getNoticeManageDownData();
                $('input[name="tzggzt"]').flyDropDownList({
                    dataSource: statusDownData,
                    tips: ' '
                });
            },
            /**
             * [renderNoticeManageTable 渲染table]
             * @return {[type]} [description]
             */
            renderNoticeManageTable: function() {
                pageNum = 4;
                pages = fly.dataSource({
                    data: noticeManage.render.getNoticeManageTableData(),
                    pageSize: pageNum
                });
                $('#noticeManageTable').flyGrid({
                    rowIndex: true,
                    check: false,
                    cols: [{
                        "name": "公告标题",
                        "field": "tzggbt",
                        "class": "notice-title",
                        "w": 190
                    }, {
                        "name": "发布处室",
                        "field": "fbcsbm",
                        "class": "notice-publish"
                    }, {
                        "name": "状态",
                        "field": "tzggzt",
                        "class": "notice-status"
                    }, {
                        "name": "发布时间",
                        "field": "fbsj",
                        "class": "notice-publish-time"
                    }, {
                        "name": "操作",
                        "class": "notice-operate"
                    }],
                    dataSource: pages,
                    afterRender: function() {
                        $('tbody .notice-operate').empty();
                        $('tbody').find('tr').each(function() {
                            var statusTxt = $(this).find('.notice-status').text(),
                                operateTxt = $(this).find('.notice-operate');
                            if (statusTxt == '已发布') {
                                operateTxt.append('<a class="notice-manage-look-btn" href="javascript:;">查看</a>');
                            } else {
                                operateTxt.append('<a class="notice-manage-publish-btn" href="javascript:;">发布</a>');
                                operateTxt.append('<a class="notice-manage-delete-btn" href="javascript:;">删除</a>');
                            }
                        });

                    }
                });
                $('#noticeManageTablePages').flyPagination({
                    dataSource: pages

                });
            },
            /**
             * [lookNoticeManageList 查看详情]
             * @param  {Object} obj [点击对象]
             * @return {[type]}     [description]
             */
            lookNoticeManageList: function(obj) {
                var number = $(obj.parent().parent().children()[0]).text();
                $(noticeManageData).each(function(index, item) {
                    if (index == (number - 1)) {
                        $('.notice-manage-default-div').addClass('hide');
                        $('.notice-manage-look-div').removeClass('hide');
                        $('#lookNoticeManageTableTitle').text(item.tzggbt);
                        $('#lookNoticeManageTableText').text(item.listText);
                    };
                });
            },
            /**
             * [publishNoticeManageList tab点击发布公告]
             * @param  {Object} obj [点击对象]
             * @return {[type]}     [description]
             */
            publishNoticeManageList: function(obj) {
                var number = $(obj.parent().parent().children()[0]).text();
                $(noticeManageData).each(function(index, item) {
                    if (index == (number - 1)) {
                        $('.notice-manage-default-div').addClass('hide');
                        $('.notice-manage-publish-div').removeClass('hide');
                        $('#publishNoticeManageTableDataId').val(item.id);
                        $('#publishNoticeManageTableTitle').val(item.tzggbt);
                        $('#publishNoticeManageTableText').text(item.listText);
                    };
                });
            },
            /**
             * [deleteNoticeManageList 删除公告]
             * @param  {Object} obj [点击对象]
             * @return {[type]}     [description]
             */
            deleteNoticeManageList: function(obj) {
                var id, url, number = $(obj.parent().parent().children()[0]).text();
                $(noticeManageData).each(function(index, item) {
                    if (index == (number - 1)) {
                        fly.dialog({
                            title: "提示",
                            content: "确定要删除吗？",
                            ok: function() {
                                id = item.id;
                                url = '../json/list-data-notice-manage.json?id=' + id;
                                $('#noticeManageTable').empty();
                                $('#noticeManageTablePages').empty();
                                $.get(url, function() {
                                    noticeManage._eventController.renderNoticeManageTable();
                                    utils.tipsDialog('删除成功');
                                });
                            },
                            cancel: true
                        });
                    };
                });
            },
            /**
             * [searchNoticeManageList 查询公告]
             * @return {[type]} [查询到的结果]
             */
            searchNoticeManageList: function() {
                var start = $('#publishTimeStart').val().replace(/[^0-9]/g, ''),
                    end = $('#publishTimeEnd').val().replace(/[^0-9]/g, ''),
                    title = $('#noticeManageTitle').val();
                titleLength = $.trim(title).length;
                if (titleLength != '' && titleLength > 40) {
                    $('#noticeManageTitle').flyTooltip({
                        content: "标题长度不能超过40个字符"
                    });
                } else if (parseInt(start) > parseInt(end)) {
                    $('#publishTimeStart').flyTooltip({
                        content: "发布开始时间不能大于发布结束时间"
                    });
                } else {
                    $('#myNoticeForm').flyForm();
                    var searchData = $('#myNoticeForm').data('flyForm').data();
                    $('#noticeManageTable').empty();
                    $('#noticeManageTablePages').empty();
                    $.post('../json/list-data-notice-manage.json', searchData, function() {
                        noticeManage._eventController.renderNoticeManageTable();
                    });
                };
            },
            /**
             * [scratchNoticeManageList 暂存公告]
             * @return {[type]} [description]
             */
            scratchNoticeManageList: function() {
                var flag = noticeManage._eventController.noticeManagePublishValidation();
                if (flag) {
                    $('#myNoticeFormPublish').flyForm();
                    var scratchData = $('#myNoticeFormPublish').data('flyForm').data();
                    $('#noticeManageTable').empty();
                    $('#noticeManageTablePages').empty();
                    $.post('../json/down-data-notice-manage.json', scratchData, function() {
                        noticeManage._eventController.renderNoticeManageTable();
                        utils.tipsDialog('暂存成功');
                        $('#noticeManageContainer>div').addClass('hide');
                        $('.notice-manage-default-div').removeClass('hide');
                    });
                };
            },
            /**
             * [scratchNoticeManageList 点击按钮发布公告]
             * @return {[type]} [description]
             */
            publishBtnNoticeManageList: function() {
                var flag = noticeManage._eventController.noticeManagePublishValidation();
                if (flag) {
                    fly.dialog({
                        title: "提示",
                        content: "确定要发布吗？",
                        ok: function() {
                            $('#myNoticeFormPublish').flyForm();
                            var publishData = $('#myNoticeFormPublish').data('flyForm').data();
                            $('#noticeManageTable').empty();
                            $('#noticeManageTablePages').empty();
                            $.post('../json/down-data-notice-manage.json', publishData, function() {
                                noticeManage._eventController.renderNoticeManageTable();
                                utils.tipsDialog('发布成功');
                                $('#noticeManageContainer>div').addClass('hide');
                                $('.notice-manage-default-div').removeClass('hide');
                            });
                            return true;
                        },
                        cancel: function() {
                            return true;
                        }
                    });
                };
            },
            /**
             * [scratchNoticeManageList 发布公告验证]
             * @return {[type]} [description]
             */
            noticeManagePublishValidation: function() {
                $('#myNoticeFormPublish').flyForm();
                var publishTitleLength = $.trim($('#publishNoticeManageTableTitle').val()).length,
                    publishTxtLength = $.trim($('#publishNoticeManageTableText').val()).length;
                if (publishTitleLength === 0) {
                    $('#publishNoticeManageTableTitle').flyTooltip({
                        content: '标题不能为空'
                    });
                    return false;
                } else if (publishTitleLength > 40) {
                    $('#publishNoticeManageTableTitle').flyTooltip({
                        content: '最多输入40个字符'
                    });
                    return false;
                } else if (publishTxtLength === 0) {
                    $('#publishNoticeManageTableText').flyTooltip({
                        content: '正文不能为空'
                    });
                    return false;
                } else if (publishTxtLength > 200) {
                    $('#publishNoticeManageTableText').flyTooltip({
                        content: '最多输入200个字符'
                    });
                    return false;
                } else {
                    return true;
                };
            },
            /**
             * [getPageInfo 获取pageNum与currentPage]
             * @param  {[type]} thisTxt [description]
             * @param  {[type]} pages   [description]
             * @return {[type]}         [description]
             */
            getPageInfo: function(thisTxt,pages) {
                var url='';
                totalPage = pages.totalPages();
                pageNum = pages.pageSize();
                if (thisTxt === "首页" || (thisTxt === "上一页" && currentPage == 1)) {
                    currentPage = 1;
                } else if (thisTxt === "上一页" && currentPage > 1) {
                    currentPage--;
                } else if (thisTxt === "下一页" && currentPage < totalPage) {
                    currentPage++;
                } else if (thisTxt === "末页" || (thisTxt === "下一页" && currentPage == totalPage)) {
                    currentPage = totalPage;
                } else {
                    currentPage = parseInt(thisTxt);
                };
                // console.log('当前页' + currentPage);
                // console.log('每页' + pageNum + '条记录');
                // console.log('总页数' + totalPage);
                var pageInfoData = {
                    pageNum: pageNum,
                    currentPage: currentPage
                };
                // $('#noticeManageTable').empty();
                // $('#noticeManageTablePages').empty();
                $.post(url, pageInfoData, function() {
                    // noticeManage._eventController.renderNoticeManageTable()
                });
               
            }
        },
        init: function() {
            noticeManage._addEvent();
        }
    };

    $(function() {
        noticeManage.init();
    });
});