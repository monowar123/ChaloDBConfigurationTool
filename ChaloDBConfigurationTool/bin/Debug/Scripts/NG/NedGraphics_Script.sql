CREATE TABLE nedgraphics
(
  id serial NOT NULL,
  linenumber integer,
  status character varying(254),
  clf_code1 character varying(254),
  clf_code2 character varying(254),
  sleutel1 character varying(254),
  sleutel2 character varying(254),
  sleutel3 character varying(254),
  kenm character varying(1000),
  geotype character varying(1),
  geotxt character varying(200000),
  xml character varying(300000),
  CONSTRAINT nedgraphics_pkey PRIMARY KEY (id),
  CONSTRAINT nedgraphics_linenumber_key UNIQUE (linenumber)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE nedgraphics
  OWNER TO "AOXX";