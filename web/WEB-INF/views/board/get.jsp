<%--
  Created by IntelliJ IDEA.
  User: hwangjeonghwan
  Date: 2022/09/07
  Time: 1:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri ="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../includes/header.jsp"%>

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Board Read</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                Board Read
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-lg-6">

                            <div class="form-group">
                                <label>bno</label>
                                <input class="form-control" name="bno" value="<c:out value="${board.bno}"/>" readonly>
                            </div>
                            <div class="form-group">
                                <label>title</label>
                                <input class="form-control" name="title" value="<c:out value="${board.title}"/>" readonly>
                            </div>
                            <div class="form-group">
                                <label>Text area</label>
                                <textarea class="form-control" rows="3" name="content" readonly><c:out value="${board.content}"/></textarea>
                            </div>
                            <div class="form-group">
                                <label>Writer</label>
                                <input class="form-control" name="writer" value="<c:out value="${board.writer}"/>" readonly>
                            </div>
                            <div class="form-group">
                                <label>RegDate</label>
                                <input class="form-control" name="regdate" value="<fmt:formatDate value="${board.regdate}" pattern="yyyy/MM/dd"/>" readonly>
                            </div>
                            <div class="form-group">
                                <label>Update Date</label>
                                <input class="form-control" name="updateDate" value="<fmt:formatDate value="${board.updateDate}" pattern="yyyy/MM/dd"/>" readonly>
                            </div>
                            <button data-oper="modify" class="btn btn-default">Modify Button</button>
                            <button data-oper="list" class="btn btn-info">List</button>
                        <form id="operForm" action="/board/modify" method="get">
                            <input type="hidden" id="bno" name="bno" value="<c:out value="${board.bno}"/>">
                            <input type="hidden" name="pageNum" value="<c:out value="${cri.pageNum}"/>">
                            <input type="hidden" name="amount" value="<c:out value="${cri.amount}"/>">
                            <input type="hidden" name="type" value="${pageMaker.cri.type}">
                            <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
                        </form>
                    </div>
                </div>
                <!-- /.row (nested) -->
            </div>
            <!-- /.panel-body -->
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
    <div class="col-lg-12">
        <!-- /.panel -->
        <div class="panel panel-default">
            <%--<div class="panel-heading">
                <i class="fa fa-comments fa-fw"></i> Reply
            </div>--%>
            <div class="panel-heading">
                <i class="fa fa-comments fa-fw"></i> Reply
                <button id="addReplyBtn" class="btn btn-primary btn-xs pull-right">New Reply</button>
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">

                <ul class="chat">
                    <!-- start reply -->
                    <li class="left clearfix" data-rno="12">
                        <div>
                            <div class="header">
                                <strong class="primary-font">user00</strong>
                                <small class="pull-right text-muted">2018-01-01 13:13</small>
                            </div>
                            <p>Good job</p>
                        </div>
                    </li>
                    <!-- end reply -->
                </ul>
                <!-- /.panel .chat-panel -->
            </div>
            <!-- /.panel .chat-panel -->
            <div class="panel-footer">

            </div>
        </div>
    </div>
    <!-- ./ end row -->
</div>
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label>Reply</label>
                    <input class="form-control" name="reply" value="New Reply~~">
                </div>
                <div class="form-group">
                    <label>Replyer</label>
                    <input class="form-control" name="replyer" value="New Replyer">
                </div>
                <div class="form-group">
                    <label>Reply Date</label>
                    <input class="form-control" name="replyDate" value="">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button id="modalModBtn" type="button" class="btn btn-warning">Modify</button>
                <button id="modalRemoveBtn" type="button" class="btn btn-danger">Remove</button>
                <button id="modalRegisterBtn" type="button" class="btn btn-primary" data-dismiss="modal">Register</button>
                <button id="modalCloseBtn" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<script type="text/javascript" src="/resources/js/reply.js"></script>
<script>

    $(document).ready(function () {
        var bnoValue = '<c:out value="${board.bno}"/> ';
        var replyUL = $(".chat");
        var pageNum = 1;
        var replyPageFooter = $(".panel-footer");

        function showReplyPage(replyCnt) {

            var endNum = Math.ceil(pageNum / 10.0) * 10;
            var startNum = endNum - 9;

            var prev = startNum != 1;
            var next = false;

            if(endNum * 10 >= replyCnt) {
                endNum = Math.ceil(replyCnt/10.0);
            }

            if(endNum * 10 < replyCnt) {
                next = true;
            }

            //////////////////p440 var str
        }
        showList(1);

        function showList(page) {
            replyService.getList({bno:bnoValue,page: page||1}, function (replyCnt, list) {

                console.log("replyCnt: " + replyCnt);
                console.log("list: " + list);
                console.log(list);

                if(page == -1) {
                    pageNum = Math.ceil(replyCnt/10.0);
                    showList(pageNum);
                    return;
                }

                var str = "";
                if (list == null || list.length === 0) {
                   replyUL.html("");

                   return;
                }
                for (var i = 0, len = list.length || 0; i < len; i++) {
                    str += "<li class='left clearfix' data-rno='" + list[i].rno + "'>";
                    str += "    <div><div class='header'><strong class='primary-font'>" + list[i].replyer + "</strong>";
                    str += "        <small class='pull=right text-muted'>" + replyService.displayTime(list[i].replyDate) + "</small></div>";
                    str += "        <p>" + list[i].reply + "</p></div></li>";
                }
                replyUL.html(str);
            }) //end function
        } // end showList

        var modal = $(".modal");
        var modalInputReply = modal.find("input[name='reply']");
        var modalInputReplyer = modal.find("input[name='replyer']");
        var modalInputReplyDate = modal.find("input[name='replyDate']");

        var modalModBtn = $("#modalModBtn");
        var modalRemoveBtn = $("#modalRemoveBtn");
        var modalRegisterBtn = $("#modalRegisterBtn");

        $("#addReplyBtn").on("click", function (e) {
            modal.find("input").val("");
            modalInputReplyDate.closest("div").hide();
            modal.find("button[id !='modalCloseBtn']").hide();

            modalRegisterBtn.show();

            $(".modal").modal("show");
        })

        modalRegisterBtn.on("click", function (e){
            var reply = {
                reply: modalInputReply.val(),
                replyer: modalInputReplyer.val(),
                bno: bnoValue
            }
            replyService.add(reply, function (result) {
                alert(result);

                modal.find("input").val("");
                modal.modal("hide");

                //showList(1);
                showList(-1);
            })
        })

        modalModBtn.on("click", function (e) {
            var reply = {
                rno:modal.data("rno"), reply:modalInputReply.val(),replyer: modalInputReplyer.val()
            };

            replyService.update(reply, function (result) {
                alert(result);
                modal.modal("hide");
                showList(1);
            })
        })

        modalRemoveBtn.on("click", function (e) {
            var rno = modal.data("rno");

            replyService.remove(rno, function (result) {
                alert(result);
                modal.modal("hide");
                showList(1);
            })
        })

        $(".chat").on("click", "li", function (e) {
            var rno = $(this).data("rno");

            replyService.get(rno, function (reply) {
                modalInputReply.val(reply.reply);
                modalInputReplyer.val(reply.replyer);
                modalInputReplyDate.val(replyService.displayTime(reply.replyDate)).attr("readonly", "readonly");
                modal.data("rno", reply.rno);

                modal.find("button[id !='modalCloseBtn']").hide();
                modalModBtn.show();
                modalRemoveBtn.show();

                $(".modal").modal("show");
            })
        })



    })





    /*replyService.getList({bno:bnoValue, page:1}, function (list) {

        for (var i = 0, len = list.length||0; i < len; i++){
            console.log(list[i])
        }
            })*/

    /*replyService.remove(40, function (count) {
        console.log(count);

        if (count === "success") {
            alert("removed");
        }
    }, function (err) {
        alert('error...');
    })*/

    /*replyService.update({
        rno: 39,
        bno: bnoValue,
        reply: "Modified Reply..."
    }, function (result) {
        alert("수정완료");
    })*/

    /*replyService.get(1, function (data) {
        console.log(data);
    })*/
</script>

<script type="text/javascript">
    $(document).ready(function() {
        console.log(replyService);
    });
</script>
<script type="text/javascript">
    $(document).ready(function (){
        let operForm = $("#operForm");

        $("button[data-oper='modify']").on("click", function(e){
            operForm.attr("action", "/board/modify").submit();
        })

        $("button[data-oper='list']").on("click", function(e){
            operForm.find("#bno").remove();
            operForm.attr("action", "/board/list").submit();
        })
    })
</script>
<%@include file="../includes/footer.jsp"%>