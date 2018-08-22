-- ===================================================================
--                          Assemble the data
--  Author:
--         ning.jun16@ztesoft.com
--  Purpose:
--         1. Assemble the data for batching Check In service.
--  NOTE:
--         1. This is for callservice tool
--         2. Change "STAFF_ID", "STAFF_JOB_ID" and "JOB_ID" if needed.
--         3. Change the where condition clause if needed.
--         4. The order should be assigned to right handler.
--         5. Copy the output to callservice data file.
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
select '{"MERGE_TASK_ORDER_NO":"' || a.merge_task_order_no || '"},'  as resemble_data
  from twf_task_order a
 where a.task_order_no in (select last_task_order_no from t_task_order);
