
---------------------------------------------------------INDEXES-------------------------------------------------------------------------------------------
/*
DROP INDEX orgpbp_geom_idx;
 DROP INDEX orgpbp_gix;
DROP INDEX orgpbp_id_idx;
DROP INDEX v_hitbgtpbp_t_geom_idx;
DROP INDEX v_hitbgtpbp_t_gix;
DROP INDEX orgpbptmp_geom_idx;
DROP INDEX orgpbptmp_gix;
DROP INDEX orgpbptmp_id_idx;
DROP INDEX  woonplaatsen_wkb_geometry_geom_idx;
*/

CREATE INDEX hitbgt_bagid_idx ON hitbgt USING btree(bagid);

-- Index: woonplaatsen_wkb_geometry_geom_idx
CREATE INDEX woonplaatsen_wkb_geometry_geom_idx
  ON woonplaatsen
  USING gist
  (wkb_geometry);


-- Index: orgpbp_geom_idx
CREATE INDEX orgpbp_geom_idx
  ON orgpbp
  USING btree
  (the_geom);

-- Index: orgpbp_gix



CREATE INDEX orgpbp_gix
  ON orgpbp
  USING gist
  (the_geom);

-- Index: orgpbp_id_idx


CREATE INDEX orgpbp_id_idx
  ON orgpbp
  USING btree
  (id);

-- Index: v_hitbgtpbp_t_geom_idx



CREATE INDEX hitbgtpbp_permap_geom_idx
  ON hitbgtpbp_permap
  USING btree
  (the_geom);

-- Index: v_hitbgtpbp_t_gix



CREATE INDEX hitbgtpbp_permap_gix
  ON hitbgtpbp_permap
  USING gist
  (the_geom);

-- Index: orgpbptmp_geom_idx



CREATE INDEX orgpbptmp_geom_idx
  ON orgpbptmp
  USING btree
  (the_geom);

-- Index: orgpbptmp_gix



CREATE INDEX orgpbptmp_gix
  ON orgpbptmp
  USING gist
  (the_geom);

-- Index: orgpbptmp_id_idx



CREATE INDEX orgpbptmp_id_idx
  ON orgpbptmp
  USING btree
  (id);