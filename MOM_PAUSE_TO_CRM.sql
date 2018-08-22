--================================
--      Assemble the data
--================================
select '{"ORDER_NBR":"' || a.ord_no || '","REASON":"pause for Ethiopian Airline","OPERATION_TYPE":"1","ASK_NO":"' || a.ask_no || '"},'
  from tom_exec_order a
 where a.ask_no in
       ();
