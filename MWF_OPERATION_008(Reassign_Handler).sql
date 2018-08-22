-- ===================================================================
--                          Assemble the data
--  Author:
--         ning.jun16@ztesoft.com
--  Purpose:
--         1. Assemble the data for batching Reassign_Handler service.
--  NOTE:
--         1. This is for callservice tool
--         2. Change the "STAFF_ID", "STAFF_JOB_ID" and "JOB_ID" if needed.
--         3. Change the where condition cluase if needed.
--         4. Copy the output to callservice data file.
-- ===================================================================
with t_task_order as
 (select tto.ord_no, max(tto.task_order_no) last_task_order_no
    from twf_task_order tto
   where tto.ord_no in
         (select eo.ord_no
            from tom_exec_order eo
           where eo.new_num in
                 ('902 ', '8218', '8229', '8365', '8480', '8521', '8589', '8604', '8680', '8708', '8712'))
   group by tto.ord_no)
select '{"ORD_NO":"' || a.ord_no || '", "TASK_TYPE":"' || a.task_type || '", "TASK_ORDER_NO":"' || a.task_order_no ||
        '", "APPOINTMENT_NO":"' || '' || '", "WORKORDER_TYPE":"' || a.workorder_type || '", "WORKORDER_NO":"' ||
        a.workorder_no || '", "MERGE_TASK_ORDER_NO":"' || a.merge_task_order_no ||
        '", "START_DATE":"", "END_DATE":"", "STAFF_ID":"113160,", "STAFF_JOB_ID":"251972,", "JOB_ID":"1", "OPER_DESC":"Reassign_Handler"},' as resemble_data
  from twf_task_order a
 where a.task_order_no in (select last_task_order_no from t_task_order);
