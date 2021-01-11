set define off
spool axis2_demo_init.log

prompt

prompt Creating table TAB_DEMO
prompt =======================
prompt

create table TAB_DEMO
(
  id          VARCHAR2(50) not null,
  demoname    VARCHAR2(400),
  demodate    TIMESTAMP(6),
  whoupdateid VARCHAR2(50),
  updateddate TIMESTAMP(6),
  whocreateid VARCHAR2(50) default 'auto' not null,
  createddate TIMESTAMP(6) default sysdate not null,
  whoremoveid VARCHAR2(50),
  removedate  TIMESTAMP(6),
  removed     VARCHAR2(1) default '0' not null
)
;

comment on table TAB_DEMO
  is 'DEMO';
comment on column TAB_DEMO.demoname
  is '名称';
comment on column TAB_DEMO.demodate
  is '时间';
comment on column TAB_DEMO.whoupdateid
  is '更新人id';
comment on column TAB_DEMO.updateddate
  is '更新时间';
comment on column TAB_DEMO.whocreateid
  is '创建人id';
comment on column TAB_DEMO.createddate
  is '创建时间';
comment on column TAB_DEMO.whoremoveid
  is '删除人id';
comment on column TAB_DEMO.removedate
  is '删除时间';
comment on column TAB_DEMO.removed
  is '标记(0=有效，1=删除)';
alter table TAB_DEMO
  add constraint PK_TAB_DEMO primary key (ID);

set feedback off
prompt Loading TAB_DEMO...
insert into TAB_DEMO (id, demoname, demodate, whoupdateid, updateddate, whocreateid, createddate, whoremoveid, removedate, removed)
values ('33333333333', 'sssssRASP.docx', to_timestamp('26-04-2018 17:18:48.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 'f2qasdfasfwerqwe', to_timestamp('26-04-2018 17:18:49.360000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, '0');
insert into TAB_DEMO (id, demoname, demodate, whoupdateid, updateddate, whocreateid, createddate, whoremoveid, removedate, removed)
values ('444444444444444444', '百度RASP.docx', to_timestamp('26-04-2018 14:04:03.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 'f2qasdfasfwerqwe', to_timestamp('26-04-2018 14:04:04.170000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, '0');
insert into TAB_DEMO (id, demoname, demodate, whoupdateid, updateddate, whocreateid, createddate, whoremoveid, removedate, removed)
values ('4d77dfc6b0bd4114a5c2963886cd47bb', 'JS000000WS-XK-0004', null, 'aaa', null, '1234567809876543', to_timestamp('25-02-2016 14:33:59.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, '0');
insert into TAB_DEMO (id, demoname, demodate, whoupdateid, updateddate, whocreateid, createddate, whoremoveid, removedate, removed)
values ('f709c5ffdb2749c888bec058ba427192', 'JS000000WS-XK-0003', null, 'dddd', null, '1234567809876543', to_timestamp('25-02-2016 14:34:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, '0');
insert into TAB_DEMO (id, demoname, demodate, whoupdateid, updateddate, whocreateid, createddate, whoremoveid, removedate, removed)
values ('ded8b73a4d27498ca9909b9358517ff4', '无锡', to_timestamp('13-07-2011 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 'auto', to_timestamp('24-02-2016 09:36:34.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, '0');
insert into TAB_DEMO (id, demoname, demodate, whoupdateid, updateddate, whocreateid, createddate, whoremoveid, removedate, removed)
values ('3eb49d55dbb6437d9791a86702c7f6b5', 'JS000000WS-XK-111', null, null, null, '1234567809876543', to_timestamp('25-02-2016 14:33:59.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, '0');
commit;
prompt 6 records loaded
set feedback on
set define on
prompt Done..

spool off