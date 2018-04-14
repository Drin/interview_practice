
-- Create Function
DELIMITER $$
CREATE OR REPLACE FUNCTION determine_variant_type (ref_seq VARCHAR(256), alt_seq VARCHAR(256))
RETURNS ENUM('SNV', 'MNV', 'INS', 'DEL', 'INDEL') DETERMINISTIC
BEGIN
   DECLARE calc_variant_type ENUM('SNV', 'MNV', 'INS', 'DEL', 'INDEL');

   SET calc_variant_type = CASE
                              WHEN     LENGTH(ref_seq) = 1
                                   AND LENGTH(ref_seq) = LENGTH(alt_seq)
                              THEN 'SNV'

                              WHEN /*
                                    * Fill in conditions
                                    */
                              THEN 'MNV'

                              -- Replace 'UNKNOWN' with correct variant type
                              WHEN     LENGTH(ref_seq) > 1
                                   AND LENGTH(alt_seq) = 1
                                   AND /* Fill in final condition here */
                              THEN 'UNKNOWN'

                              /* One more WHEN clause; Replace 'UNKNOWN' with
                               * correct variant type
                               */
                              WHEN 
                              THEN 'UNKNOWN'

                              ELSE /* One last variant type */
                           END
   ;

   RETURN calc_variant_type;
END
;
$$

-- Invoke Function
DELIMITER ;

SELECT  chromosome
       ,genomic_coord
       ,ref_allele_seq
       ,alt_allele_seq
       ,determine_variant_type(ref_allele_seq, alt_allele_seq)

FROM genomics.variants
;
