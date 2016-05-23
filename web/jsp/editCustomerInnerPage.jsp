<%--
  Created by IntelliJ IDEA.
  User: zay19
  Date: 5/23/2016
  Time: 4:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <%--<title>editCustomerInnerPage</title>--%>

    <!-- 修改用户信息 -->
    <div class="modal fade" id="editCustomer-modal" tabindex="-1" role="dialog" aria-labelledby="modal-label"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span
                            aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
                    <h4 class="modal-title" id="editCustomer-modal-label">修改会员信息</h4>
                </div>
                <div class="modal-body">

                    <!-- 修改信息 -->
                    <form class="form-horizontal form-signin" action="editCustomer.jsp" method="post" name="regFrom">
                        <!-- 参数无法传递进来 -->
                        <div class="control-group">
                            <div class="controls">
                                <input disabled class=" input-block-level" type="text" id="editCustomerName"
                                       placeholder="<%=request.getParameter("nameEdit")%>" name="editCustomerName"/>
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="controls">
                                <input disabled class=" input-block-level" type="text" id="editCustomerIdCard"
                                       placeholder="<%=request.getParameter("idCardEdit")%>" name="editCustomerIdCard"/>
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="controls">
                                <input class=" input-block-level" type="text" id="editCustomerPhone" placeholder="修改手机号"
                                       name="editCustomerPhone"/>
                            </div>
                        </div>

                        <div class="control-group">
                            <div class="controls">
                                <input class=" input-block-level" type="text" id="editCustomerPassword" placeholder="修改密码"
                                       name="editCustomerPassword"/>
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="controls">
                                <input class=" input-block-level" type="text" id="editCustomerMoney" placeholder="修改余额"
                                       name="editCustomerMoney"/>
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="controls">
                                <button type="submit" class="btn btn-large btn-primary">确定修改</button>
                            </div>
                        </div>
                    </form>


                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>

