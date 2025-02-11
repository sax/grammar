# EMS MySQL Manager 2.6.0.1
# ---------------------------------------
# Host     : localhost
# Port     : 3306
# Database : openpay


SET FOREIGN_KEY_CHECKS=0;

DROP DATABASE IF EXISTS openpay;

CREATE DATABASE openpay;

USE openpay;

#
# Structure for the `afxfilter` table : 
#

DROP TABLE IF EXISTS afxfilter;

CREATE TABLE afxfilter (
  kodfilter bigint(20) NOT NULL default '0',
  descfilter varchar(50) NOT NULL default '',
  tablename varchar(50) NOT NULL default '',
  UNIQUE KEY afxfilter_x (kodfilter)
) TYPE=InnoDB;

#
# Structure for the `afxfilterd` table : 
#

DROP TABLE IF EXISTS afxfilterd;

CREATE TABLE afxfilterd (
  kodfilterd bigint(20) NOT NULL default '0',
  kodfilter bigint(20) NOT NULL default '0',
  pedio varchar(50) NOT NULL default '',
  telestis varchar(20) NOT NULL default '',
  timi varchar(50) NOT NULL default '',
  joint varchar(10) default NULL,
  PRIMARY KEY  (kodfilterd),
  KEY kodfilter (kodfilter),
  CONSTRAINT 0_15 FOREIGN KEY (kodfilter) REFERENCES afxfilter (kodfilter) ON DELETE CASCADE ON UPDATE CASCADE
) TYPE=InnoDB;

#
# Structure for the `afxinfo` table : 
#

DROP TABLE IF EXISTS afxinfo;

CREATE TABLE afxinfo (
  dbver varchar(10) default NULL
) TYPE=InnoDB;

#
# Structure for the `afxkeygen` table : 
#

DROP TABLE IF EXISTS afxkeygen;

CREATE TABLE afxkeygen (
  tblname varchar(50) NOT NULL default '',
  lastid bigint(20) default '0',
  PRIMARY KEY  (tblname),
  KEY lastid (lastid)
) TYPE=InnoDB;

#
# Structure for the `afxoperators` table : 
#

DROP TABLE IF EXISTS afxoperators;

CREATE TABLE afxoperators (
  operatorname varchar(50) NOT NULL default '',
  operator varchar(50) NOT NULL default '',
  orderno tinyint(4) default NULL,
  PRIMARY KEY  (operatorname),
  UNIQUE KEY afxoperators_x (operatorname)
) TYPE=InnoDB;

#
# Structure for the `afxptoseis` table : 
#

DROP TABLE IF EXISTS afxptoseis;

CREATE TABLE afxptoseis (
  onom varchar(50) NOT NULL default '',
  gen varchar(50) default NULL,
  ait varchar(50) default NULL,
  PRIMARY KEY  (onom)
) TYPE=InnoDB;

#
# Structure for the `afxtable` table : 
#

DROP TABLE IF EXISTS afxtable;

CREATE TABLE afxtable (
  tablename varchar(50) NOT NULL default '',
  tabledesc varchar(50) NOT NULL default '',
  PRIMARY KEY  (tablename),
  UNIQUE KEY afxtable_x (tablename)
) TYPE=InnoDB;

#
# Structure for the `afxtablefields` table : 
#

DROP TABLE IF EXISTS afxtablefields;

CREATE TABLE afxtablefields (
  tablename varchar(50) NOT NULL default '',
  fieldname varchar(70) NOT NULL default '',
  fielddesc varchar(70) NOT NULL default '',
  sorting tinyint(1) default NULL,
  fieldtype varchar(15) NOT NULL default '',
  orderno bigint(20) default NULL,
  PRIMARY KEY  (tablename,fieldname),
  KEY tablename (tablename),
  CONSTRAINT 0_22 FOREIGN KEY (tablename) REFERENCES afxtable (tablename) ON DELETE CASCADE ON UPDATE CASCADE
) TYPE=InnoDB;

#
# Structure for the `afxtranslate` table : 
#

DROP TABLE IF EXISTS afxtranslate;

CREATE TABLE afxtranslate (
  id bigint(20) NOT NULL default '0',
  el varchar(255) default NULL,
  uk varchar(255) default NULL,
  PRIMARY KEY  (id)
) TYPE=InnoDB;

#
# Structure for the `misth_zpxrisi` table : 
#

DROP TABLE IF EXISTS misth_zpxrisi;

CREATE TABLE misth_zpxrisi (
  kodxrisi varchar(4) NOT NULL default '',
  descxrisi varchar(50) NOT NULL default '',
  startdate date NOT NULL default '0000-00-00',
  enddate date NOT NULL default '0000-00-00',
  maskposo varchar(50) default '###,##0.00',
  maskposot varchar(50) default '###,##0.00',
  maskdate varchar(50) default 'dd/mm/yyyy',
  eteria varchar(100) default '',
  eteriadesc varchar(100) default '',
  address varchar(100) default '',
  tk varchar(15) default '',
  city varchar(50) default '',
  phone varchar(100) default '',
  fax varchar(100) default '',
  maskdate_e varchar(50) default 'dd/mm/yyyy',
  maskposo_e varchar(50) default '###,##0.00',
  maskposot_e varchar(50) default '###,##0.00',
  afm varchar(20) default '',
  doy varchar(100) default '',
  round int(11) default '2',
  prn_logo1 varchar(100) default NULL,
  prn_logo2 varchar(100) default NULL,
  prn_logo3 varchar(100) default NULL,
  prn_logo4 varchar(100) default NULL,
  prn_logo5 varchar(100) default NULL,
  prn_sign1_prosf varchar(100) default NULL,
  prn_sign1_name varchar(100) default NULL,
  prn_sign2_prosf varchar(100) default NULL,
  prn_sign2_name varchar(100) default NULL,
  prn_sign3_prosf varchar(100) default NULL,
  prn_sign3_name varchar(100) default NULL,
  prn_notes1 longtext,
  prn_notes2 longtext,
  prn_notes3 longtext,
  PRIMARY KEY  (kodxrisi)
) TYPE=InnoDB;

#
# Structure for the `misth_zpperiod` table : 
#

DROP TABLE IF EXISTS misth_zpperiod;

CREATE TABLE misth_zpperiod (
  kodperiod char(2) NOT NULL default '',
  kodxrisi varchar(4) NOT NULL default '',
  descperiod varchar(50) NOT NULL default '',
  orderno int(11) default NULL,
  PRIMARY KEY  (kodperiod,kodxrisi),
  KEY kodxrisi (kodxrisi),
  CONSTRAINT 0_26 FOREIGN KEY (kodxrisi) REFERENCES misth_zpxrisi (kodxrisi) ON DELETE CASCADE ON UPDATE CASCADE
) TYPE=InnoDB;

#
# Structure for the `misth_zpkat` table : 
#

DROP TABLE IF EXISTS misth_zpkat;

CREATE TABLE misth_zpkat (
  kodkat char(2) NOT NULL default '',
  kodxrisi varchar(4) NOT NULL default '',
  desckat varchar(50) NOT NULL default '',
  PRIMARY KEY  (kodkat,kodxrisi),
  KEY kodxrisi (kodxrisi),
  CONSTRAINT 0_28 FOREIGN KEY (kodxrisi) REFERENCES misth_zpxrisi (kodxrisi) ON DELETE CASCADE ON UPDATE CASCADE
) TYPE=InnoDB;

#
# Structure for the `misth_final` table : 
#

DROP TABLE IF EXISTS misth_final;

CREATE TABLE misth_final (
  kodfinal bigint(20) NOT NULL default '0',
  kodxrisi varchar(4) NOT NULL default '',
  descfinal varchar(100) NOT NULL default '',
  title longtext,
  datefinal date NOT NULL default '0000-00-00',
  kodkat char(2) default NULL,
  kodperiod char(2) default NULL,
  aa bigint(20) default NULL,
  PRIMARY KEY  (kodfinal,kodxrisi),
  KEY kodxrisi (kodxrisi),
  KEY datefinal (datefinal),
  KEY kodkat (kodkat,kodxrisi),
  KEY kodperiod (kodperiod,kodxrisi),
  CONSTRAINT 0_30 FOREIGN KEY (kodperiod, kodxrisi) REFERENCES misth_zpperiod (kodperiod, kodxrisi) ON UPDATE CASCADE,
  CONSTRAINT 0_31 FOREIGN KEY (kodxrisi) REFERENCES misth_zpxrisi (kodxrisi) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT 0_32 FOREIGN KEY (kodkat, kodxrisi) REFERENCES misth_zpkat (kodkat, kodxrisi) ON UPDATE CASCADE
) TYPE=InnoDB;

#
# Structure for the `misth_zptmima` table : 
#

DROP TABLE IF EXISTS misth_zptmima;

CREATE TABLE misth_zptmima (
  kodtmima char(2) NOT NULL default '',
  kodxrisi varchar(4) NOT NULL default '',
  desctmima varchar(50) NOT NULL default '',
  PRIMARY KEY  (kodtmima,kodxrisi),
  KEY kodxrisi (kodxrisi),
  CONSTRAINT 0_34 FOREIGN KEY (kodxrisi) REFERENCES misth_zpxrisi (kodxrisi) ON DELETE CASCADE ON UPDATE CASCADE
) TYPE=InnoDB;

#
# Structure for the `misth_zpidikot` table : 
#

DROP TABLE IF EXISTS misth_zpidikot;

CREATE TABLE misth_zpidikot (
  kodidikot char(2) NOT NULL default '',
  kodxrisi varchar(4) NOT NULL default '',
  descidikot varchar(50) NOT NULL default '',
  PRIMARY KEY  (kodidikot,kodxrisi),
  KEY kodxrisi (kodxrisi),
  CONSTRAINT 0_36 FOREIGN KEY (kodxrisi) REFERENCES misth_zpxrisi (kodxrisi) ON DELETE CASCADE ON UPDATE CASCADE
) TYPE=InnoDB;

#
# Structure for the `misth_zpthesi` table : 
#

DROP TABLE IF EXISTS misth_zpthesi;

CREATE TABLE misth_zpthesi (
  kodthesi char(2) NOT NULL default '',
  kodxrisi varchar(4) NOT NULL default '',
  descthesi varchar(50) NOT NULL default '',
  PRIMARY KEY  (kodthesi,kodxrisi),
  KEY kodxrisi (kodxrisi),
  CONSTRAINT 0_38 FOREIGN KEY (kodxrisi) REFERENCES misth_zpxrisi (kodxrisi) ON DELETE CASCADE ON UPDATE CASCADE
) TYPE=InnoDB;

#
# Structure for the `misth_zptamio` table : 
#

DROP TABLE IF EXISTS misth_zptamio;

CREATE TABLE misth_zptamio (
  kodtamio char(2) NOT NULL default '',
  kodxrisi varchar(4) NOT NULL default '',
  desctamio varchar(50) NOT NULL default '',
  PRIMARY KEY  (kodtamio,kodxrisi),
  KEY kodxrisi (kodxrisi),
  KEY kodxrisi_2 (kodxrisi,kodtamio),
  CONSTRAINT 0_40 FOREIGN KEY (kodxrisi) REFERENCES misth_zpxrisi (kodxrisi) ON DELETE CASCADE ON UPDATE CASCADE
) TYPE=InnoDB;

#
# Structure for the `misth_zpoikog` table : 
#

DROP TABLE IF EXISTS misth_zpoikog;

CREATE TABLE misth_zpoikog (
  kodoikog char(2) NOT NULL default '',
  kodxrisi varchar(4) NOT NULL default '',
  descoikog varchar(50) NOT NULL default '',
  PRIMARY KEY  (kodoikog,kodxrisi),
  KEY kodxrisi (kodxrisi),
  CONSTRAINT 0_42 FOREIGN KEY (kodxrisi) REFERENCES misth_zpxrisi (kodxrisi) ON DELETE CASCADE ON UPDATE CASCADE
) TYPE=InnoDB;

#
# Structure for the `misth_ypal` table : 
#

DROP TABLE IF EXISTS misth_ypal;

CREATE TABLE misth_ypal (
  kodypal bigint(20) NOT NULL default '0',
  kodxrisi varchar(4) NOT NULL default '',
  surname varchar(70) NOT NULL default '',
  name varchar(30) default '',
  fathername varchar(30) default '',
  adt varchar(10) default '',
  mitroo varchar(20) default '',
  afm varchar(10) default '',
  doy varchar(50) default '',
  kodtitlos char(2) default '',
  birthdate date default '0000-00-00',
  homephone varchar(50) default '',
  mobilphone varchar(50) default '',
  sex char(1) default '',
  spouse varchar(100) default '',
  childs int(11) default '0',
  prostmeli int(11) default '0',
  city varchar(50) default '',
  area varchar(50) default '',
  address varchar(100) default '',
  tk varchar(10) default '',
  email varchar(100) default '',
  kodtmima char(2) default '',
  kodidikot char(2) default '',
  jobtitle varchar(100) default '',
  hireddate date default '0000-00-00',
  rehireddate date default '0000-00-00',
  termdate date default '0000-00-00',
  termreason varchar(100) default '',
  jobphone varchar(50) default '',
  intphone varchar(20) default '',
  klimakio int(11) default '0',
  bathmos char(1) default '',
  klados varchar(10) default '',
  bank varchar(100) default '',
  bankno varchar(50) default '',
  exeldate date default '0000-00-00',
  kodthesi char(2) default '',
  kodoikog char(2) default '',
  kodtamio char(2) default NULL,
  mothername varchar(30) default NULL,
  newexeldate date default NULL,
  PRIMARY KEY  (kodypal,kodxrisi),
  KEY kodxrisi (kodxrisi),
  KEY kodtitlos (kodtitlos,kodxrisi),
  KEY kodtmima (kodtmima,kodxrisi),
  KEY kodidikot (kodidikot,kodxrisi),
  KEY kodthesi (kodthesi,kodxrisi),
  KEY kodoikog (kodoikog,kodxrisi),
  KEY surname (surname,kodxrisi),
  KEY adt (adt,kodxrisi),
  KEY mitroo (mitroo,kodxrisi),
  KEY afm (afm,kodxrisi),
  KEY sex (sex,kodxrisi),
  KEY kodtamio (kodtamio,kodxrisi),
  CONSTRAINT 0_44 FOREIGN KEY (kodxrisi) REFERENCES misth_zpxrisi (kodxrisi) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT 0_45 FOREIGN KEY (kodtmima, kodxrisi) REFERENCES misth_zptmima (kodtmima, kodxrisi) ON UPDATE CASCADE,
  CONSTRAINT 0_46 FOREIGN KEY (kodidikot, kodxrisi) REFERENCES misth_zpidikot (kodidikot, kodxrisi) ON UPDATE CASCADE,
  CONSTRAINT 0_47 FOREIGN KEY (kodthesi, kodxrisi) REFERENCES misth_zpthesi (kodthesi, kodxrisi) ON UPDATE CASCADE,
  CONSTRAINT 0_48 FOREIGN KEY (kodtamio, kodxrisi) REFERENCES misth_zptamio (kodtamio, kodxrisi) ON UPDATE CASCADE,
  CONSTRAINT 0_49 FOREIGN KEY (kodoikog, kodxrisi) REFERENCES misth_zpoikog (kodoikog, kodxrisi) ON UPDATE CASCADE
) TYPE=InnoDB;

#
# Structure for the `misth_final_ypal` table : 
#

DROP TABLE IF EXISTS misth_final_ypal;

CREATE TABLE misth_final_ypal (
  kodfinal bigint(20) NOT NULL default '0',
  kodypal bigint(20) NOT NULL default '0',
  kodxrisi varchar(4) NOT NULL default '',
  plirdate date default NULL,
  PRIMARY KEY  (kodfinal,kodypal,kodxrisi),
  KEY kodfinal (kodfinal,kodxrisi),
  KEY kodypal (kodypal,kodxrisi),
  CONSTRAINT 0_51 FOREIGN KEY (kodfinal, kodxrisi) REFERENCES misth_final (kodfinal, kodxrisi) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT 0_52 FOREIGN KEY (kodypal, kodxrisi) REFERENCES misth_ypal (kodypal, kodxrisi) ON UPDATE CASCADE
) TYPE=InnoDB;

#
# Structure for the `misth_zpepidom` table : 
#

DROP TABLE IF EXISTS misth_zpepidom;

CREATE TABLE misth_zpepidom (
  kodepidom varchar(20) NOT NULL default '',
  kodxrisi varchar(4) NOT NULL default '',
  descepidom varchar(50) NOT NULL default '',
  hasforo int(11) default '0',
  expr longtext,
  isasf int(11) default '0',
  autoforos int(11) default '0',
  hasasf int(11) default '0',
  PRIMARY KEY  (kodepidom,kodxrisi),
  KEY kodxrisi (kodxrisi),
  KEY hasasf (hasasf,kodxrisi),
  KEY hasforo (hasforo,kodxrisi),
  KEY isasf (isasf,kodxrisi),
  KEY autoforos (autoforos,kodxrisi),
  CONSTRAINT 0_54 FOREIGN KEY (kodxrisi) REFERENCES misth_zpxrisi (kodxrisi) ON DELETE CASCADE ON UPDATE CASCADE
) TYPE=InnoDB;

#
# Structure for the `misth_final_ypal_epidom` table : 
#

DROP TABLE IF EXISTS misth_final_ypal_epidom;

CREATE TABLE misth_final_ypal_epidom (
  kodfinal bigint(20) NOT NULL default '0',
  kodypal bigint(20) NOT NULL default '0',
  kodepidom varchar(20) NOT NULL default '',
  kodxrisi varchar(4) NOT NULL default '',
  poso double(15,3) default NULL,
  aa int(11) default NULL,
  notes longtext,
  PRIMARY KEY  (kodfinal,kodypal,kodepidom,kodxrisi),
  KEY kodfinal (kodfinal,kodypal,kodxrisi),
  KEY kodepidom (kodepidom,kodxrisi),
  CONSTRAINT 0_56 FOREIGN KEY (kodfinal, kodypal, kodxrisi) REFERENCES misth_final_ypal (kodfinal, kodypal, kodxrisi) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT 0_57 FOREIGN KEY (kodepidom, kodxrisi) REFERENCES misth_zpepidom (kodepidom, kodxrisi) ON UPDATE CASCADE
) TYPE=InnoDB;

#
# Structure for the `misth_zpkrat` table : 
#

DROP TABLE IF EXISTS misth_zpkrat;

CREATE TABLE misth_zpkrat (
  kodkrat varchar(20) NOT NULL default '',
  kodxrisi varchar(4) NOT NULL default '',
  desckrat varchar(50) NOT NULL default '',
  isforos int(11) default '0',
  isasf int(11) default '0',
  isautoforos int(11) default '0',
  PRIMARY KEY  (kodkrat,kodxrisi),
  KEY kodxrisi (kodxrisi),
  KEY isforos (isforos,kodxrisi),
  KEY isasf (isasf,kodxrisi),
  KEY isautoforos (isautoforos,kodxrisi),
  CONSTRAINT 0_59 FOREIGN KEY (kodxrisi) REFERENCES misth_zpxrisi (kodxrisi) ON DELETE CASCADE ON UPDATE CASCADE
) TYPE=InnoDB;

#
# Structure for the `misth_kratapod` table : 
#

DROP TABLE IF EXISTS misth_kratapod;

CREATE TABLE misth_kratapod (
  kodkratapod bigint(20) NOT NULL auto_increment,
  kodxrisi varchar(4) NOT NULL default '',
  desckratapod varchar(100) NOT NULL default '',
  apoddate date NOT NULL default '0000-00-00',
  PRIMARY KEY  (kodkratapod),
  KEY kodxrisi (kodxrisi),
  KEY apoddate (apoddate,kodxrisi),
  CONSTRAINT 0_61 FOREIGN KEY (kodxrisi) REFERENCES misth_zpxrisi (kodxrisi) ON DELETE CASCADE ON UPDATE CASCADE
) TYPE=InnoDB;

#
# Structure for the `misth_final_ypal_krat` table : 
#

DROP TABLE IF EXISTS misth_final_ypal_krat;

CREATE TABLE misth_final_ypal_krat (
  kodfinal bigint(20) NOT NULL default '0',
  kodypal bigint(20) NOT NULL default '0',
  kodkrat varchar(20) NOT NULL default '',
  kodxrisi varchar(4) NOT NULL default '',
  poso double(15,3) default NULL,
  aa int(11) default NULL,
  notes longtext,
  kodkratapod bigint(20) default NULL,
  PRIMARY KEY  (kodfinal,kodypal,kodkrat,kodxrisi),
  KEY kodfinal (kodfinal,kodypal,kodxrisi),
  KEY kodkrat (kodkrat,kodxrisi),
  KEY kodkratapod (kodkratapod),
  CONSTRAINT 0_63 FOREIGN KEY (kodfinal, kodypal, kodxrisi) REFERENCES misth_final_ypal (kodfinal, kodypal, kodxrisi) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT 0_64 FOREIGN KEY (kodkrat, kodxrisi) REFERENCES misth_zpkrat (kodkrat, kodxrisi) ON UPDATE CASCADE,
  CONSTRAINT 0_65 FOREIGN KEY (kodkratapod) REFERENCES misth_kratapod (kodkratapod) ON DELETE SET NULL ON UPDATE CASCADE
) TYPE=InnoDB;

#
# Structure for the `misth_fylo` table : 
#

DROP TABLE IF EXISTS misth_fylo;

CREATE TABLE misth_fylo (
  kodfylo varchar(4) NOT NULL default '',
  kodxrisi varchar(4) NOT NULL default '',
  descfylo varchar(50) NOT NULL default '',
  PRIMARY KEY  (kodfylo,kodxrisi),
  KEY kodxrisi (kodxrisi),
  CONSTRAINT 0_67 FOREIGN KEY (kodxrisi) REFERENCES misth_zpxrisi (kodxrisi) ON DELETE CASCADE ON UPDATE CASCADE
) TYPE=InnoDB;

#
# Structure for the `misth_fylo_epidom` table : 
#

DROP TABLE IF EXISTS misth_fylo_epidom;

CREATE TABLE misth_fylo_epidom (
  kodfylo varchar(4) NOT NULL default '',
  kodepidom varchar(20) NOT NULL default '',
  kodxrisi varchar(4) NOT NULL default '',
  expr longtext,
  aa int(11) default NULL,
  notes longtext,
  PRIMARY KEY  (kodfylo,kodepidom,kodxrisi),
  KEY kodxrisi (kodxrisi),
  KEY kodfylo (kodfylo,kodxrisi),
  KEY kodepidom (kodepidom,kodxrisi),
  KEY aa (aa),
  CONSTRAINT 0_69 FOREIGN KEY (kodfylo, kodxrisi) REFERENCES misth_fylo (kodfylo, kodxrisi) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT 0_70 FOREIGN KEY (kodepidom, kodxrisi) REFERENCES misth_zpepidom (kodepidom, kodxrisi) ON UPDATE CASCADE
) TYPE=InnoDB;

#
# Structure for the `misth_fylo_krat` table : 
#

DROP TABLE IF EXISTS misth_fylo_krat;

CREATE TABLE misth_fylo_krat (
  kodfylo varchar(4) NOT NULL default '',
  kodkrat varchar(20) NOT NULL default '',
  kodxrisi varchar(4) NOT NULL default '',
  expr longtext,
  aa int(11) default NULL,
  notes longtext,
  PRIMARY KEY  (kodfylo,kodkrat,kodxrisi),
  KEY kodxrisi (kodxrisi),
  KEY kodfylo (kodfylo,kodxrisi),
  KEY kodkrat (kodkrat,kodxrisi),
  KEY aa (aa),
  CONSTRAINT 0_72 FOREIGN KEY (kodfylo, kodxrisi) REFERENCES misth_fylo (kodfylo, kodxrisi) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT 0_73 FOREIGN KEY (kodkrat, kodxrisi) REFERENCES misth_zpkrat (kodkrat, kodxrisi) ON UPDATE CASCADE
) TYPE=InnoDB;

#
# Structure for the `misth_fylo_ypal` table : 
#

DROP TABLE IF EXISTS misth_fylo_ypal;

CREATE TABLE misth_fylo_ypal (
  kodfylo varchar(4) NOT NULL default '',
  kodypal bigint(20) NOT NULL default '0',
  kodxrisi varchar(4) NOT NULL default '',
  PRIMARY KEY  (kodfylo,kodypal,kodxrisi),
  KEY kodxrisi (kodxrisi),
  KEY kodfylo (kodfylo,kodxrisi),
  KEY kodypal (kodypal,kodxrisi),
  CONSTRAINT 0_75 FOREIGN KEY (kodfylo, kodxrisi) REFERENCES misth_fylo (kodfylo, kodxrisi) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT 0_76 FOREIGN KEY (kodypal, kodxrisi) REFERENCES misth_ypal (kodypal, kodxrisi) ON UPDATE CASCADE
) TYPE=InnoDB;

#
# Structure for the `misth_report` table : 
#

DROP TABLE IF EXISTS misth_report;

CREATE TABLE misth_report (
  kodreport char(2) NOT NULL default '',
  kodxrisi varchar(4) NOT NULL default '',
  descreport varchar(100) NOT NULL default '',
  subtitle longtext,
  print_margin_top int(11) default NULL,
  print_margin_bottom int(11) default NULL,
  print_margin_left int(11) default NULL,
  print_margin_right int(11) default NULL,
  print_orientation int(11) default NULL,
  print_paper_size int(11) default NULL,
  print_scale int(11) default NULL,
  prn_notes1 longtext,
  prn_notes2 longtext,
  PRIMARY KEY  (kodreport,kodxrisi),
  KEY kodxrisi (kodxrisi),
  CONSTRAINT 0_78 FOREIGN KEY (kodxrisi) REFERENCES misth_zpxrisi (kodxrisi) ON DELETE CASCADE ON UPDATE CASCADE
) TYPE=InnoDB;

#
# Structure for the `misth_report_cols` table : 
#

DROP TABLE IF EXISTS misth_report_cols;

CREATE TABLE misth_report_cols (
  kodcol int(11) NOT NULL default '0',
  kodreport char(2) NOT NULL default '',
  kodxrisi varchar(4) NOT NULL default '',
  expr longtext,
  header_text varchar(50) default NULL,
  width int(11) default NULL,
  aa int(11) default NULL,
  PRIMARY KEY  (kodcol,kodreport,kodxrisi),
  KEY kodreport (kodreport,kodxrisi),
  CONSTRAINT 0_80 FOREIGN KEY (kodreport, kodxrisi) REFERENCES misth_report (kodreport, kodxrisi) ON DELETE CASCADE ON UPDATE CASCADE
) TYPE=InnoDB;

#
# Structure for the `misth_report_ypal` table : 
#

DROP TABLE IF EXISTS misth_report_ypal;

CREATE TABLE misth_report_ypal (
  kodreport char(2) NOT NULL default '',
  kodypal bigint(20) NOT NULL default '0',
  kodxrisi varchar(4) NOT NULL default '',
  PRIMARY KEY  (kodreport,kodypal,kodxrisi),
  KEY kodreport (kodreport,kodxrisi),
  KEY kodypal (kodypal,kodxrisi),
  CONSTRAINT 0_82 FOREIGN KEY (kodreport, kodxrisi) REFERENCES misth_report (kodreport, kodxrisi) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT 0_83 FOREIGN KEY (kodypal, kodxrisi) REFERENCES misth_ypal (kodypal, kodxrisi) ON UPDATE CASCADE
) TYPE=InnoDB;

#
# Structure for the `misth_zpyvar` table : 
#

DROP TABLE IF EXISTS misth_zpyvar;

CREATE TABLE misth_zpyvar (
  kodyvar varchar(20) NOT NULL default '',
  kodxrisi varchar(4) NOT NULL default '',
  descyvar varchar(50) NOT NULL default '',
  expr longtext,
  PRIMARY KEY  (kodyvar,kodxrisi),
  KEY kodxrisi (kodxrisi),
  CONSTRAINT 0_85 FOREIGN KEY (kodxrisi) REFERENCES misth_zpxrisi (kodxrisi) ON DELETE CASCADE ON UPDATE CASCADE
) TYPE=InnoDB;

#
# Structure for the `misth_ypal_yvar` table : 
#

DROP TABLE IF EXISTS misth_ypal_yvar;

CREATE TABLE misth_ypal_yvar (
  kodypal bigint(20) NOT NULL default '0',
  kodyvar varchar(20) NOT NULL default '',
  kodxrisi varchar(4) NOT NULL default '',
  expr longtext,
  aa int(11) default '0',
  PRIMARY KEY  (kodypal,kodyvar,kodxrisi),
  KEY kodxrisi (kodxrisi),
  KEY kodypal (kodypal,kodxrisi),
  KEY kodyvar (kodyvar,kodxrisi),
  KEY aa (aa),
  CONSTRAINT 0_87 FOREIGN KEY (kodypal, kodxrisi) REFERENCES misth_ypal (kodypal, kodxrisi) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT 0_88 FOREIGN KEY (kodyvar, kodxrisi) REFERENCES misth_zpyvar (kodyvar, kodxrisi) ON UPDATE CASCADE
) TYPE=InnoDB;

#
# Structure for the `misth_zpstath` table : 
#

DROP TABLE IF EXISTS misth_zpstath;

CREATE TABLE misth_zpstath (
  kodstath varchar(20) NOT NULL default '',
  kodxrisi varchar(4) NOT NULL default '',
  descstath varchar(50) NOT NULL default '',
  poso double(15,3) default NULL,
  PRIMARY KEY  (kodstath,kodxrisi),
  KEY kodxrisi (kodxrisi),
  CONSTRAINT 0_90 FOREIGN KEY (kodxrisi) REFERENCES misth_zpxrisi (kodxrisi) ON DELETE CASCADE ON UPDATE CASCADE
) TYPE=InnoDB;

#
# Structure for the `misth_zptitlos` table : 
#

DROP TABLE IF EXISTS misth_zptitlos;

CREATE TABLE misth_zptitlos (
  kodtitlos char(2) NOT NULL default '',
  kodxrisi varchar(4) NOT NULL default '',
  desctitlos varchar(10) NOT NULL default '',
  PRIMARY KEY  (kodtitlos,kodxrisi),
  KEY kodxrisi (kodxrisi),
  CONSTRAINT 0_92 FOREIGN KEY (kodxrisi) REFERENCES misth_zpxrisi (kodxrisi) ON DELETE CASCADE ON UPDATE CASCADE
) TYPE=InnoDB;

#
# Data for the `afxinfo` table  (LIMIT 0,500)
#

INSERT INTO afxinfo (dbver) VALUES 
  ('0.1.1');

COMMIT;

#
# Data for the `afxoperators` table  (LIMIT 0,500)
#

INSERT INTO afxoperators (operatorname, operator, orderno) VALUES 
  ('��� �����','is not',10),
  ('�����','is',9),
  ('���','=',1),
  ('����������','>',3),
  ('���������� � ���','>=',5),
  ('���������','<',2),
  ('��������� � ���','<=',4),
  ('�� �� ������� ��','not like',8),
  ('�� ������� ��','like',7),
  ('��� ���','<>',6);

COMMIT;

#
# Data for the `afxtranslate` table  (LIMIT 0,500)
#

INSERT INTO afxtranslate (id, el, uk) VALUES 
  (1,'&�����','&Cancel'),
  (2,'&�������','&Cancel'),
  (3,'&���������','&Find'),
  (4,'&���������','&Details'),
  (5,'&��������','&Update'),
  (6,'&�������� ������ ������','&Update licence'),
  (7,'&���������','&Copy'),
  (8,'&������� - �������','&Wage - bonus'),
  (9,'&��������','&Left'),
  (10,'&�������','&Help'),
  (11,'&�����','&Right'),
  (12,'&����������','&Create'),
  (13,'&��������','&Delete'),
  (14,'&���������� �������','Page &setup'),
  (15,'&��������','&Records'),
  (16,'&����������','&Print'),
  (17,'&��������','&Print'),
  (18,'&�������� �����������','&Print payroll'),
  (19,'&���������','&Printer'),
  (20,'&������','&Exit'),
  (21,'&�����','&Up'),
  (22,'&�����������','&Edit'),
  (23,'&�������','&Next'),
  (24,'&������� ������','&Next filter'),
  (25,'&����','&Zoom'),
  (26,'&���������� ���������','&Clear histoyr'),
  (27,'&���������� ��������','Arange &vertically'),
  (28,'&��������','&Close'),
  (29,'&�������','&Deduction'),
  (30,'&��������','Go&to'),
  (31,'&��������� ���������','Employee&variable'),
  (32,'&��� ����������','&New payroll'),
  (33,'&��������� ��������','Arange &horizontally'),
  (34,'&��������','&Window'),
  (35,'&�������','&Tables'),
  (36,'&����','&Back'),
  (37,'&����������� ��������','&About'),
  (38,'&����������� ���������','Application &information'),
  (39,'&������� ���������','Pay&unsettled'),
  (40,'&������� �����������','&Pay payroll'),
  (41,'&������� ��������','View &options'),
  (42,'&����������� ������','&Previous filter'),
  (43,'&��������','&Insert'),
  (44,'&�������','&Pages'),
  (45,'&�������������','&Totals'),
  (46,'&����������� ����������','Arange &icons'),
  (47,'&��������� �������','&Last record'),
  (48,'&�����','&End'),
  (49,'@@����','@@NULL'),
  (50,'@@���','@@YES'),
  (51,'@@���','@@NO'),
  (52,'e-mail','e-mail'),
  (53,'�&�������','&Update'),
  (54,'�&������������','&Replace'),
  (55,'�.�.�.','ID No.'),
  (56,'�.�.�.','Tax No.'),
  (57,'�/�','S.N.'),
  (58,'����� �����','Exp. Reason'),
  (59,'���������','Accusative'),
  (60,'�������','Cancel'),
  (61,'������� �.�.','Promotion'),
  (62,'������ ��.','Promotion'),
  (63,'������ ����.','Promotion'),
  (64,'������ ���������','PROMOSION'),
  (65,'������ ���������','Promotion'),
  (66,'������ ������','Change season'),
  (67,'���&�����','&Update'),
  (68,'���������','Search'),
  (69,'��������� ��������','Search records'),
  (70,'��������� �����������','Search employees'),
  (71,'��������� �����������','Search payroll'),
  (72,'��������� ����������� (���������)','Search payroll (details)'),
  (73,'������� �������� - ���������','WAGES - DEDUCTIONS ANALYSIS'),
  (74,'������� �������� - ��������� (��� ����������)','Wages - deductions analysis (per employee)'),
  (75,'������� �������� - ��������� ��� ��������','Wages - deductions analysis (per employee)'),
  (76,'���������','Details'),
  (77,'��������� ��������� �����������','Payrolls (analytic)'),
  (78,'��������','Update'),
  (79,'�������� ������������','Update contents'),
  (80,'������� �������','Open filter'),
  (81,'���������','Copies'),
  (82,'��������� ���������','Backup'),
  (83,'��������� �����','Copy sheet'),
  (84,'��������� �����������','Unrequited payrolls'),
  (85,'��������� ����������� (�)','Unrequited payrolls (�)'),
  (86,'��������� ����������� (�)','Unrequited payrolls (P)'),
  (87,'��������� ����������� �����������','UNREQUITED PAYROLLS'),
  (88,'��������� ����������� �����������','Unrequited payrolls'),
  (89,'��������� ����������� ����������� (��� ����������)','Unrequited payrolls (per employee)'),
  (90,'��������� ����������� ����������� (��� ���������)','Unrequited payrolls (per payroll)'),
  (91,'��������� ����������� ����������� (��� ��������)','Unrequited payrolls (per employee)'),
  (92,'���','From'),
  (93,'������� ���������','RETURN DEDUCTIONS'),
  (94,'������� ���������','Deposit deductions'),
  (95,'��������','Wages'),
  (96,'�������� / ���������','Wages / Bonus'),
  (97,'��������/���������','Wages / Bonus'),
  (98,'������� - �������','Wages / Bonus'),
  (99,'���������� ����','Deselect all'),
  (100,'���������� &��������','&Save record'),
  (101,'���������� �������','Save &filter'),
  (102,'�������� ��������','Connection faild'),
  (103,'��������','April'),
  (104,'��. �����.','Account No'),
  (105,'��. �����������','Payroll No'),
  (106,'�����.','Number'),
  (107,'�����. ����.','Payroll No'),
  (108,'�����. ������','Children'),
  (109,'������� ���.','Account No'),
  (110,'������� �������','Register No'),
  (111,'������� �����������','Payroll No'),
  (112,'��������','Left'),
  (113,'�����','Male'),
  (114,'������ ����������','Backup file'),
  (115,'���.','I.D.'),
  (116,'���. ������','Insurance'),
  (117,'���.��.','E.I.'),
  (118,'����������� ������','Insurance agencies'),
  (119,'����������� �������','Insurance wages'),
  (120,'������� ��������','Personal data'),
  (121,'�������� �����������','Personal payrolls'),
  (122,'�������� ����������� �����������','Personal payrolls'),
  (123,'������� ���������','Personal payroll'),
  (124,'������� ��������� �����������','PERSONAL PAYROLL'),
  (125,'���������','August'),
  (126,'���.���.','Tax'),
  (127,'���� � �������� ���� �����������','This header has been registered'),
  (128,'���� � ������� ���� �����������','This deduction already exists'),
  (129,'���� � ��������� ���� �����������','This variable already exists'),
  (130,'���� � ��������� ������� ���','This description already exists'),
  (131,'���� �� ������� ���� �����������','This wages already exists'),
  (132,'���� �� ������� ���� �����������','This word already exists'),
  (133,'����� � ������� ������� ���','This code already exists'),
  (134,'����� � ������� ��� ���� �������� ��������� � ���� ��� ��������','This user doesn\'t have the permission to use this application'),
  (135,'����� � ������� ����� ���������','This user is incative'),
  (136,'����� � ������� ������� ��� ���� ����� �������','This user already exists at the group'),
  (137,'��������� �����','Autotelic tax'),
  (138,'��������� ������������� ����������','Autotelic tax wages'),
  (139,'����������� ����������','Duty free wages'),
  (140,'������','Grade'),
  (141,'���� ���������','Database'),
  (142,'������','Generally'),
  (143,'������','Possessive'),
  (144,'������ ������','GRAND TOTAL'),
  (145,'������ ������','Grand total'),
  (146,'�.�.�.','Tax office'),
  (147,'����','ten'),
  (148,'���������','Nineteen'),
  (149,'�������','Sixteen'),
  (150,'��������','Seventeen'),
  (151,'��������','Eighteen'),
  (152,'���������','Fifteen'),
  (153,'������������','Fourteen'),
  (154,'���������','Thirteen'),
  (155,'����������','December'),
  (156,'��� �������� ��������','No records found'),
  (157,'��� ������ ������ �����������','You must give the payroll number'),
  (158,'��� ������ ������ ���������� ���������','You must give the backup file'),
  (159,'��� ������ ���� ���������','You must give the database'),
  (160,'��� ������ ��/���','You must give the date'),
  (161,'��� ������ ������� ���� ���������','You must give search criteria'),
  (162,'��� ������ ������','You must give the code'),
  (163,'��� ������ ����� �������','You must give the filter name'),
  (164,'��� ������ �����','You must give the field'),
  (165,'��� ������ �������','You must give the operator'),
  (166,'��� ������ ��� ���� ��� ��������','You must give the start of the period'),
  (167,'��� ������ ��� ��/��� ��������','You must give the return date'),
  (168,'��� ������ ��� ��/��� �������','You must give the start date'),
  (169,'��� ������ ��� ��/��� �����','You must give the end date'),
  (170,'��� ������ ��� ��/��� ��� �����������','You must give the payroll date'),
  (171,'��� ������ ��� ��������� �����������','You must give the payroll category'),
  (172,'��� ������ ��� ��������� ��� �����������','You must give the payroll category'),
  (173,'��� ������ ��� ��������','You must give the header'),
  (174,'��� ������ ��� ���� ��� ��������','You must give the end of the period'),
  (175,'��� ������ ��� ���������','You must give the description'),
  (176,'��� ������ ��� ��������� ��� ��������','You must give the return description'),
  (177,'��� ������ ��� ��������� ��� �����������','You must give the Payroll description'),
  (178,'��� ������ ��� ��������� ��� ������ �������','You must give the group description'),
  (179,'��� ������ ��� ��������� ��� ��������','You must give the period description'),
  (180,'��� ������ ��� ��������� ��� ��������','You must give the constant description'),
  (181,'��� ������ ��� ��������� ��� ������','You must give the season description'),
  (182,'��� ������ ��� ������� ��� �����������','You must give the period of payroll'),
  (183,'��� ������ ����','You must give the value'),
  (184,'��� ������ �� ������� ��� ���������','You must give the employee surname'),
  (185,'��� ������ �� ����� ������','You must give the user name'),
  (186,'��� ������ �� ������ ��� ����������� �������','You must give the bin folder'),
  (187,'��� ������ ��� ����������','You must give the server'),
  (188,'��� ������ ��� ������','You must give the code'),
  (189,'��� ������ ��� ������ ���������','You must give the access code'),
  (190,'��� ������ ��� ������ ��� ��������','You must give the period code'),
  (191,'��� ������ ��� ������ ��� ��������','You must give the constant code'),
  (192,'��� ������ ��� ������ ��� ���������� ���������','You must give the backup folder'),
  (193,'��� ��������� ������� ���������','You must select the period to transfer'),
  (194,'��� ��������� �����','You must select the season'),
  (195,'��� ��������� ������','You must select a user'),
  (196,'��� ����� �������� ��������� ��������','You haven\'t the permission to delete records'),
  (197,'��� ����� �������� ��������� ��������','You haven\'t the permission to add records'),
  (198,'��� ����� ����� ��������','You must give criteria'),
  (199,'��� ����� ����� ������� ���������','You must give the join field'),
  (200,'��� ����� �������� �������','You must select wages'),
  (201,'��� ����� �������� ����������','You must select an employee'),
  (202,'��� ����� �������� ������ ��������','You must select an employee'),
  (203,'��� ����� �������� �������','You must select a deduction'),
  (204,'��� ����� �������� ���������','You must select a variable'),
  (205,'��� ����� �������� ����� �����������','You must select one or more calculate sheet'),
  (206,'��� ����� �������� �����','You must select the season'),
  (207,'�����','Right'),
  (208,'����������','Create'),
  (209,'���������� &��������-����������','Create &wages - Bonus'),
  (210,'���������� &��������','Create &deduction'),
  (211,'���������� &���������� ���������','Create employee &variable'),
  (212,'���������� �������� - ����������','Create wages - Bonus'),
  (213,'���������� ��������-����������','Create wages - Bonus'),
  (214,'���������� ��������','Create deduction'),
  (215,'���������� ���������� ���������','Create employee variable'),
  (216,'���������� ���� �����������','Create new payroll'),
  (217,'���������� �������� ������� ����������','Create advanced filter'),
  (218,'���������� �������','Create filter'),
  (219,'���������� ������','Create season'),
  (220,'��&������ ��������','&Delete record'),
  (221,'�����.','Del.'),
  (222,'��������','Delete'),
  (223,'�������� ��������','Delete record'),
  (224,'�������� ����������� ��������','Delete selected records'),
  (225,'�������� ��� ����������� ��������','Delete current record'),
  (226,'�������� �������','Delete filter'),
  (227,'��������� ������','Available filters'),
  (228,'�����������','Server'),
  (229,'��������','Two hundred'),
  (230,'���������� �������','Page setup'),
  (231,'���������� ������� ���������','Page setup'),
  (232,'������� �������','Page orientation'),
  (233,'���������� �������','Season administration'),
  (234,'������������','Administrator'),
  (235,'���������� ��','Find to'),
  (236,'���������','Address'),
  (237,'����������','Copyright'),
  (238,'���������� ������: ����','Copyright: GPL'),
  (239,'������������','Double record'),
  (240,'���','Two'),
  (241,'��� ��������','Two thousand'),
  (242,'������','twelve'),
  (243,'����� �� �������� ��� ��������','Enter deposit data'),
  (244,'����� �� �������� ��� ���� �����������','Enter payroll data'),
  (245,'����� ��� ������ ��� ��� ��������� ��� ���� ����� �����������','Enter the code and the description of the new calculate sheet'),
  (246,'�&�������','&Records'),
  (247,'�&���������','Re&ports'),
  (248,'���������','seventy'),
  (249,'����������','Speciality'),
  (250,'����������� �����������','Employee specialities'),
  (251,'����������� ���������','Employee specialities'),
  (252,'������','Twenty'),
  (253,'������ ���','Twenty-two'),
  (254,'������ �����','Twenty-nine'),
  (255,'������ ���','Twenty-sex'),
  (256,'������ ����','Twenty-seven'),
  (257,'������ ���','Twenty-one'),
  (258,'������ ����','Twenty-eight'),
  (259,'������ �����','Twenty-five'),
  (260,'������ ��������','Twenty-four'),
  (261,'������ �����','Twenty-three'),
  (262,'����� ���������� ����������� �������','Is employeer insurance wages'),
  (263,'�������� ��/����','Enter date'),
  (264,'�������� ��������� ���������','Enter report criteria'),
  (265,'�����','One hundred'),
  (266,'������','One hundred'),
  (267,'������','Resease'),
  (268,'������ �.�.','DB version'),
  (269,'������ �����','DB version'),
  (270,'����������','Reports'),
  (271,'��������','Print'),
  (272,'�������� �������� �����������','Print personal payrolls'),
  (273,'�������� ����������� ��������','Print selected deduction'),
  (274,'�������� ����������� ������','Print user reports'),
  (275,'�������� �����������','Print payroll'),
  (276,'�������� �������������� ����������','Print total payroll'),
  (277,'���������','Printer'),
  (278,'������� �����������','Calculation form'),
  (279,'������� �� ����� ������ ��� ��� ������ �������','Enter the user name and password'),
  (280,'������� ���������','Check access'),
  (281,'�������� - �������� ��������','Show - hide treebar'),
  (282,'���','one'),
  (283,'������','Start'),
  (284,'���� � ������������ ��������� �������� �� ����������� ��� ���� ����� �����������','One or more employees exist at one or more calculation sheets'),
  (285,'������','Eleven'),
  (286,'��������','ninety'),
  (287,'��������','Action'),
  (288,'�������','Active'),
  (289,'�����','Nine'),
  (290,'����������','Nine hundred'),
  (291,'��������','Six hundred'),
  (292,'�������','Promotion'),
  (293,'������','sixty'),
  (294,'���','Six'),
  (295,'������','Exit'),
  (296,'������ ��� ��� ��������','Exit application'),
  (297,'����������','Confirmation'),
  (298,'����������.','Re-employment'),
  (299,'��������� ���������','Restore'),
  (300,'�����','Up'),
  (301,'����.','Edit'),
  (302,'�����������','Edit'),
  (303,'����������� �����','Edit calculation form'),
  (304,'������� �����������','Select employee'),
  (305,'�������','Bonus'),
  (306,'���������','Bonus'),
  (307,'��������� / ��������','Wages / Bonus'),
  (308,'�����������','Selected'),
  (309,'�����������','Selected'),
  (310,'�������� �� ��������� ��� ������ �� ������������','Select wages that you want to register'),
  (311,'�������� ��� ��������� ��� ������ �� ���������','Select deductions that you want to deposit'),
  (312,'�������� ��� ��������� ��� ������ �� ������������','Select deductions that you want to register'),
  (313,'�������� ��� ���������� ��� ��� ����� �� �������� ����������','Select the employee to create payroll'),
  (314,'�������� ���� ������������ ��� ���� ������� �� ��������� ���������','Select the employees for whom you will deposit deductions'),
  (315,'�������','Select'),
  (316,'������� �������','Select row'),
  (317,'������� �����&���','Select &record'),
  (318,'������� ���������','Printing selection'),
  (319,'������� �����������','Select employee'),
  (320,'������� ���������� ������','Select user report'),
  (321,'������� ���������','Select deductions'),
  (322,'������� ����','Select all'),
  (323,'������� ���� &��� ��������','Select &all records'),
  (324,'������� ��������','Period selection'),
  (325,'������� ���������','Select employees'),
  (326,'������� ������ �����������','Select payroll sheet(s)'),
  (327,'������� ������','Select season'),
  (328,'������� ������','User selection'),
  (329,'���������','Return'),
  (330,'�����&�� �������','&Next record'),
  (331,'�������','Next'),
  (332,'������� �������','Next record'),
  (333,'������� ������','Next filter'),
  (334,'����','Seven'),
  (335,'���������','Seven hundred'),
  (336,'�������','Surname'),
  (337,'�����������','Employees'),
  (338,'����������� ��� ������ ���������','Empolyees to be promoted'),
  (339,'�����������','Employee'),
  (340,'��������','Tools'),
  (341,'�������','Work'),
  (342,'����������� ������������ ��������','Employer insurance wages'),
  (343,'��������� ���.','Inner phone'),
  (344,'��������','Company'),
  (345,'��&����','&Find'),
  (346,'������','Find'),
  (347,'������ ��������','Find next'),
  (348,'������ ���','Find'),
  (349,'��������','Apply'),
  (350,'���','To'),
  (351,'����','Zoom'),
  (352,'����� �������','Even pages'),
  (353,'� ���������� �� ������','The payroll No'),
  (354,'� ����� �������','The user group'),
  (355,'� �������� ��� �����������','Access denied'),
  (356,'� ������� ��� ���� ��� ����������������','Database connection faild'),
  (357,'� ���� ��� ������ ��� ����� ������ ����� �������','The value is not a valid number'),
  (358,'� ���� ��� ������ ��� ����� ������ ����� ��/����','The value is not a valid date'),
  (359,'� ���� ��� ������ ��� ����� ������ ����� ����','The value is not a valid time'),
  (360,'� �������� ��/��� ����� ����� ��� ����� ������','Current date is beyond the season limits'),
  (361,'��/���','Date'),
  (362,'��/��� ����.','Deposit date'),
  (363,'��/��� ���.','Birth date'),
  (364,'��/��� ����.','Birth date'),
  (365,'��/��� ���.','Rel. date'),
  (366,'��/��� �������','Release date'),
  (367,'��/��� ������� �����������','Payroll release date'),
  (368,'��/��� �����','End date'),
  (369,'��/��� ��.','Pay date'),
  (370,'��/��� ����.','Pay date'),
  (371,'��/��� ��������','Pay date'),
  (372,'��/��� �������� �����������','Payroll payment date'),
  (373,'����������','Date'),
  (374,'������ �� ��������������;','Do you want to be replaced'),
  (375,'������ �� ������������� ��� ��������;','Do you want to exit application'),
  (376,'������ �����������','Employee post'),
  (377,'������ ���������','Employee post'),
  (378,'������/������ �����������','Employee post/grade'),
  (379,'����','Post'),
  (380,'����','Female'),
  (381,'����������','January'),
  (382,'��������','Status'),
  (383,'�������','July'),
  (384,'�������','June'),
  (385,'��&��','&Down'),
  (386,'����������','Clear'),
  (387,'���������� ���������','Clear history'),
  (388,'���������� ����������� ���������','Arange windows vertically'),
  (389,'�����������','Payrolls'),
  (390,'����������� &�����������','&Payrolls'),
  (391,'����������� ����������� (���������)','Payrolls (&details)'),
  (392,'����������� ����������� (�������������)','Payrolls (group)'),
  (393,'����������� ������','User reports'),
  (394,'��������� ��������� ���� �������','Deductions for depostition'),
  (395,'��������� �����������','PAYROLL'),
  (396,'��������� ������','User report'),
  (397,'���������','Category'),
  (398,'��������� �����������','Payroll category'),
  (399,'���������� �����������','Payroll categories'),
  (400,'����','Down'),
  (401,'��������','Header'),
  (402,'������','Mobil'),
  (403,'������','Branch'),
  (404,'��������','Close'),
  (405,'�������� ������� ���������','Close active window'),
  (406,'�������� ��� ������� ���������','Close active window'),
  (407,'����.','Pay pos'),
  (408,'����. / ������','Pay pos / grade'),
  (409,'�������','Pay pos'),
  (410,'��������','Pay pos'),
  (411,'���������','Deductions'),
  (412,'��������� ��� ����������� ������','Deductions for insurance agencies'),
  (413,'��������� ��� ��� ����� ��������','DEDUCTIONS FOR DEPOSITION'),
  (414,'��������� ��� ��� ����� ��������','Deductions for deposition'),
  (415,'��������� ���� �������','Deductions for deposition'),
  (416,'�������','Deduction'),
  (417,'�������� ���������','Print criteria'),
  (418,'���.','Code'),
  (419,'�������','Code'),
  (420,'������� ������','Sheet code'),
  (421,'����','Expire'),
  (422,'�����','List'),
  (423,'��������','Logo'),
  (424,'������ ���������','Other deductions'),
  (425,'�����','May'),
  (426,'�������','March'),
  (427,'�� ��� ������� ���� �� ����������� �� ��������� ����������� ����������� ��� ��� ����� ��� �� ��������� �������� ���� ��������','Payrolls that haven\'t been paid at selected season will be transfered to the current season'),
  (428,'�� ��� ������� ���� �� ����������� �� ������� �������� ��� ��� ����� ��� �� ��������� �������� ���� ��������','All constant tables will be transfered from the selected season to current'),
  (429,'������� �������','Paper size'),
  (430,'����','Members'),
  (431,'����� ������','Group members'),
  (432,'����������','Custom fields'),
  (433,'���������� ���������','Employee custom fields'),
  (434,'���������','Custom field'),
  (435,'�������� &��������� �����������','Transfer &unrequited payrolls'),
  (436,'�������� &�������� ���������','Transfer &static tables'),
  (437,'�������� ��������� ����������� ��� ���� �����','Transfer unrequited payrolls from other season'),
  (438,'�������� ��������� ����������� �����������','Transfer unrequited payrolls'),
  (439,'�������� ��� �����','Transfer from season'),
  (440,'�������� ���������� ��� ��������','Transfer custom fields'),
  (441,'�������� �������� ��������� ��� ���� �����','Transfer static tables from other season'),
  (442,'�������� ������','Transfer season'),
  (443,'���������','Transfer'),
  (444,'���������','Mother name'),
  (445,'������','Reg. no'),
  (446,'���','One'),
  (447,'����. ��������','Payroll period'),
  (448,'����������','Payroll'),
  (449,'�����������','Payrolls'),
  (450,'����������� ��������','Payroll period'),
  (451,'����� �������','Odd pages'),
  (452,'������ ���������','Data form'),
  (453,'�� ����� � �������� ��� ����������� �������;','Do you want to delete the selected filter?'),
  (454,'�� ����� � ��������;','Confirm deletion'),
  (455,'�� ������� � �������� �������;','Do  you want to delete current record?'),
  (456,'�� �������� � �������� �������;','Do  you want to delete current record?'),
  (457,'�� ���������� �� ����������� ��������;','Do you want to delete the selected records?'),
  (458,'��� &�������','&New record'),
  (459,'��� �������','New record'),
  (460,'��� �������','Next promotion'),
  (461,'��� ����������','New payroll'),
  (462,'��� ����� �������','New user group'),
  (463,'���� �������','New user'),
  (464,'��� &�������','&New record'),
  (465,'���������','November'),
  (466,'� �������','The code'),
  (467,'� �������','The user'),
  (468,'�&���','&All'),
  (469,'�������','eighty'),
  (470,'������ ����������� �����������','Payroll wizard'),
  (471,'�� ������������� ����������� �� ������� ���� ������� ��� �� ���������','Select the new period for transfered payrolls'),
  (472,'���. ������.','Family status'),
  (473,'���. ���������','Family status'),
  (474,'������������� �����������','Family status'),
  (475,'������������ ���������','Family status'),
  (476,'��','OK'),
  (477,'���������','October'),
  (478,'���','All'),
  (479,'��� �� ������� �������� ��� ��������� ������ �� ����������','All static tables of current season will be deleted'),
  (480,'���� �� �������','All pages'),
  (481,'����� �������','User group'),
  (482,'������ �������','User groups'),
  (483,'�����','Name'),
  (484,'����� �����������','Administrator name'),
  (485,'����� ���������','Application title'),
  (486,'����� �������','Filter name'),
  (487,'����� ������','Username'),
  (488,'����������','Subjective'),
  (489,'�������������','Full name'),
  (490,'��������� ����������� ���������','Tile windows horizontally'),
  (491,'���������','Eight hundred'),
  (492,'����','eight'),
  (493,'�','P'),
  (494,'�&������','&View'),
  (495,'�&���������� �������','&Previous record'),
  (496,'������','Children'),
  (497,'��������','Window'),
  (498,'�������� ����������','PLEASE WAIT'),
  (499,'������.','T.D.'),
  (500,'������������ �����','Retained taxes');

COMMIT;

#
# Data for the `afxtranslate` table  (LIMIT 500,500)
#

INSERT INTO afxtranslate (id, el, uk) VALUES 
  (501,'����������� �����','Rataining taxes'),
  (502,'����������','Parameters'),
  (503,'���������� ���������','Application parameters'),
  (504,'������������','Notes'),
  (505,'����� ��������� ���������','TAKE BACKUP'),
  (506,'���������','Father name'),
  (507,'�����','Field'),
  (508,'�������','fifty'),
  (509,'����������','Five hundred'),
  (510,'�����','Five'),
  (511,'���������','Description'),
  (512,'��������� ��������','Deposit description'),
  (513,'��������� �������� - ����������','Wages / Bonus description'),
  (514,'��������� �������� / ����������','Wages / Bonus description'),
  (515,'��������� �����','Post description'),
  (516,'��������� ���������','Status description'),
  (517,'��������� ����������','Report description'),
  (518,'��������� ����������','Category description'),
  (519,'��������� ��������','Deduction description'),
  (520,'��������� ����������','Custom field description'),
  (521,'��������� �����������','Payroll description'),
  (522,'��������� ������������� ����������','Family status description'),
  (523,'��������� ��������','Period description'),
  (524,'��������� ��������','Constant description'),
  (525,'��������� �������','Insurance agency description'),
  (526,'��������� ��������','Department description'),
  (527,'��������� ������','Sheet description'),
  (528,'���������','Margins'),
  (529,'�������� �����������','Payroll periods'),
  (530,'�������� ���������','Transfer period'),
  (531,'�������� �����������','Payroll period'),
  (532,'�������','Area'),
  (533,'������� �������','Page range'),
  (534,'�������','Tables'),
  (535,'������','Width'),
  (536,'�������������� �������� ������� �/��� �������� ������� ��������� �� �������','Enter page numbers or/and page range separeted by commas'),
  (537,'������ �����','Full name'),
  (538,'����������� ��� ��� ��������','Information about the application'),
  (539,'����������� ���������','Application information'),
  (540,'���������?','Paid?'),
  (541,'���������� �����������','Paid payrolls'),
  (542,'���������� ����������� �����������','PAID  PAYROLLS'),
  (543,'���������� ����������� ����������� (��� ����������)','Paid payrolls (per employee)'),
  (544,'�������','PAYMENT'),
  (545,'�������','Payment'),
  (546,'������� �����������','Payroll payment'),
  (547,'��������','Payable'),
  (548,'����','City'),
  (549,'����','Money'),
  (550,'��������','Quantity'),
  (551,'������ �� ��������� ����������� ���� ��������','You must select one employee at least'),
  (552,'������ �� ��������� ����������� ��� �������','You must select one deduction at least'),
  (553,'������ �� ��������� ����������� ��� ������� ��� �������','You must select one deduction at least'),
  (554,'������ �� ������������ ����������� ��� ����������','You must enter the subjective'),
  (555,'�����&�� ����','View &all'),
  (556,'�������','View'),
  (557,'�������  - ����������� ��� ����������� ��������','Edit - view current record'),
  (558,'������� - ����������� ��� ����������� ��������','View-edit selected record'),
  (559,'������� ��������','View options'),
  (560,'������� ����','View all'),
  (561,'������� ���� ��� ��������','View all records'),
  (562,'�����������','Previous'),
  (563,'����������� �������','Previous record'),
  (564,'����������� ������','Previous filter'),
  (565,'��������� ��� ������� ����������','Its a crucial step'),
  (566,'��������','Access'),
  (567,'�����.','Add'),
  (568,'��������','Add'),
  (569,'�������� ���� ��������','Insert new record'),
  (570,'��������','Employment'),
  (571,'�������','CAUSION'),
  (572,'�������','Causion'),
  (573,'�������. ����','Protect. memb.'),
  (574,'�����.','Title'),
  (575,'���������','Personal'),
  (576,'����&� �������','&First record'),
  (577,'����� �������','First record'),
  (578,'�������','Grammar'),
  (579,'�&� ���������','&Cascade'),
  (580,'�&������','&Collate'),
  (581,'�������','fourty'),
  (582,'��������� �������','Serial number'),
  (583,'������','Page'),
  (584,'�����������','September'),
  (585,'������','SERRES'),
  (586,'������, ���.: (23210)-41206','SERRES, PHONE: (+3023210 41206)'),
  (587,'����������','Notes'),
  (588,'�������� - ������ (������)','Skoutari - Serres (GREECE)'),
  (589,'������� ��������','Static tables'),
  (590,'��������','Constants'),
  (591,'������','Columns'),
  (592,'�������� �������� - ����������','Wages / Bonus details'),
  (593,'�������� ���������','Print details'),
  (594,'�������� �����������','Employee details'),
  (595,'�������� ����������','Custom report details'),
  (596,'�������� ��������','Deduction details'),
  (597,'�������� ����������','Custom field details'),
  (598,'�������� �����������','Payroll details'),
  (599,'�������� ������ �����������','Payroll sheet details'),
  (600,'�������� ������','Season details'),
  (601,'��������������� �����','Round digits'),
  (602,'�������������','Group'),
  (603,'������������� �����������','PAYROLL TOTALS'),
  (604,'������������� �������� ��� ��������','Period totals per employee'),
  (605,'������������� ���������� ����������� (��� ����������)','Paid payrolls totals (per employee)'),
  (606,'������������� ��������','List of payments'),
  (607,'������������� ��������� �����������','List of payrolls'),
  (608,'������������� ��������� ��������','LIST OF PAID PAYROLLS'),
  (609,'�������','spouse'),
  (610,'�������','Join'),
  (611,'������� &������','Advanced &filter'),
  (612,'��������� ���������','TOTAL DEDUCTIONS'),
  (613,'��������� ���������','Total deductions'),
  (614,'������','Total'),
  (615,'������ �������� - ����������','Wages/Bonus total'),
  (616,'������ ���������','Total deductions'),
  (617,'������ ��������','Total for deduction'),
  (618,'������ �����������','TOTAL FOR PAYROLL'),
  (619,'������ ���������','Total employees'),
  (620,'��������� ���������','Brief payroll list'),
  (621,'��������� ��������� �����������','Brief payroll list'),
  (622,'����������','Design'),
  (623,'���������� �����������','Custom reports'),
  (624,'�������','About'),
  (625,'����������� �������� �����������','Build expresion'),
  (626,'���������','Match'),
  (627,'����������� ��������� �� ���������','Cascade windows'),
  (628,'����������� ��� ����������������� ���������','Tile minimized windows'),
  (629,'���.','Ord'),
  (630,'���. ���.','Area code'),
  (631,'���. �������','Area code'),
  (632,'��������','Operator'),
  (633,'��������� �������','&Last record'),
  (634,'������ �������','Final analysis'),
  (635,'�������','four'),
  (636,'��������','Four'),
  (637,'����������','Four hundred'),
  (638,'�����. �����.','Work phone'),
  (639,'��������','Phone'),
  (640,'����','Value'),
  (641,'������','Title'),
  (642,'������ ��������','Work title'),
  (643,'�����','Department'),
  (644,'������� ���������','Departments'),
  (645,'�� ����� ��� ������� �������','Filter name already exists'),
  (646,'������','Sector'),
  (647,'�������','Bank'),
  (648,'���&����� ������','&Current page'),
  (649,'�����','Three'),
  (650,'����� ��������','Three thousand'),
  (651,'����','three'),
  (652,'���������','Three hundred'),
  (653,'�������','Thirty'),
  (654,'������� ���','Thirty-one'),
  (655,'���������� ��������','Tsakiridis Sotiris'),
  (656,'����� �����������','Expression'),
  (657,'���������','Employees'),
  (658,'������� ���','already exists'),
  (659,'�����.','Sign'),
  (660,'��������� �� ������������ ���������','Has deductions for insurance offices'),
  (661,'��������� �� �������� ����������','Has autotelic taxes'),
  (662,'��������� �� ����������� �����','Has tax deductions'),
  (663,'����������� ��������/����������','Calculate wages/bonus'),
  (664,'�����������','Footer'),
  (665,'���������','Subtitle'),
  (666,'������� ����������','Backup folder'),
  (667,'������� ���������� ���������','Backup folder'),
  (668,'������� �����������','bin folder'),
  (669,'������� ����������� ������� mysql','Mysql bin folder'),
  (670,'���','Fax'),
  (671,'�����������','February'),
  (672,'������','Filter'),
  (673,'�����','Form'),
  (674,'����������� ����������','Wages/bonus that has taxes'),
  (675,'����� ��������� �������������� �����������','Autotelic taxes'),
  (676,'������� �������','Load filter'),
  (677,'������� �������','Load file'),
  (678,'���� �����������','Payroll sheets'),
  (679,'����','Sex'),
  (680,'�������','Rulers'),
  (681,'�����','One thousand'),
  (682,'�������','Seasons'),
  (683,'�����','Season'),
  (684,'�������','Users'),
  (685,'�������','User'),
  (686,'����','Eight'),
  (687,'����','Ten'),
  (688,'������','Twelve'),
  (689,'������','eleven'),
  (690,'�������','thirty'),
  (691,'������','twenty'),
  (692,'���','two'),
  (693,'�����','five'),
  (694,'���','six'),
  (695,'����','seven'),
  (696,'�����','nine'),
  (697,'�&������','&Collate'),
  (698,'��� ������ ��������','You must give criteria'),
  (699,'&��','&OK'),
  (700,'������������ ���������','Project administrator'),
  (701,'�� �������','Default'),
  (702,'����������','Portrait'),
  (703,'���������','Landscape'),
  (704,'���','Yes'),
  (705,'���','No'),
  (706,'������ �.�. ��� ����������','D.B. version required'),
  (707,'��������, ����������� � �������� �������. ��������� ��� ��� �������� �� ���������� ��� ����� ���� ����� ���������!!!','Insert, edit or delete payroll seasons. Please note that you can\'t delete the working season!!!'),
  (708,'������ �� �������� ����������� ��� �����!','You must insert at least one season!'),
  (709,'������ ����������� �����������','Payroll setup wizard');

COMMIT;

#
# Data for the `misth_zpxrisi` table  (LIMIT 0,500)
#

INSERT INTO misth_zpxrisi (kodxrisi, descxrisi, startdate, enddate, maskposo, maskposot, maskdate, eteria, eteriadesc, address, tk, city, phone, fax, maskdate_e, maskposo_e, maskposot_e, afm, doy, round, prn_logo1, prn_logo2, prn_logo3, prn_logo4, prn_logo5, prn_sign1_prosf, prn_sign1_name, prn_sign2_prosf, prn_sign2_name, prn_sign3_prosf, prn_sign3_name, prn_notes1, prn_notes2, prn_notes3) VALUES 
  ('0001','Default season','2005-01-01','2006-12-31','###,##0.00','###,##0.00','dd/mm/yyyy','COMPANY NAME','Company description','Company address','','City','0000000','0000001','dd/mm/yyyy','###,##0.00','###,##0.00','','',2,'Logo1','Logo2','Logo3','Logo4','Logo5','Sign1 - Title','Sign1 - Name','Sign2 - Title','Sign2 - Name','Sign3 - Title','Sign3 - Name','Footer1','Footer2','Footer3');

COMMIT;

#
# Data for the `misth_zpperiod` table  (LIMIT 0,500)
#

INSERT INTO misth_zpperiod (kodperiod, kodxrisi, descperiod, orderno) VALUES 
  ('01','0001','Default period',1);

COMMIT;

#
# Data for the `misth_zpkat` table  (LIMIT 0,500)
#

INSERT INTO misth_zpkat (kodkat, kodxrisi, desckat) VALUES 
  ('01','0001','Default category');

COMMIT;

#
# Data for the `misth_zptmima` table  (LIMIT 0,500)
#

INSERT INTO misth_zptmima (kodtmima, kodxrisi, desctmima) VALUES 
  ('01','0001','Default department');

COMMIT;

#
# Data for the `misth_zpoikog` table  (LIMIT 0,500)
#

INSERT INTO misth_zpoikog (kodoikog, kodxrisi, descoikog) VALUES 
  ('01','0001','Married'),
  ('02','0001','Single'),
  ('03','0001','Divorced');

COMMIT;

#
# Data for the `misth_zpepidom` table  (LIMIT 0,500)
#

INSERT INTO misth_zpepidom (kodepidom, kodxrisi, descepidom, hasforo, expr, isasf, autoforos, hasasf) VALUES 
  ('SAL','0001','SALARY',1,NULL,0,0,0);

COMMIT;

#
# Data for the `misth_zpkrat` table  (LIMIT 0,500)
#

INSERT INTO misth_zpkrat (kodkrat, kodxrisi, desckrat, isforos, isasf, isautoforos) VALUES 
  ('PEN','0001','PENALTY',0,0,0),
  ('TAX','0001','TAXES',1,0,0);

COMMIT;

#
# Data for the `misth_zpyvar` table  (LIMIT 0,500)
#

INSERT INTO misth_zpyvar (kodyvar, kodxrisi, descyvar, expr) VALUES 
  ('SAL','0001','SALARY',NULL);

COMMIT;

