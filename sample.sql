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

                              WHEN     LENGTH(ref_seq) > 1
                                   AND LENGTH(ref_seq) = LENGTH(alt_seq)
                              THEN 'MNV'

                              WHEN     LENGTH(ref_seq) > 1
                                   AND LENGTH(alt_seq) = 1
                                   AND ref_seq LIKE CONCAT(alt_seq, '%')
                              THEN 'DEL'

                              WHEN     LENGTH(ref_seq) = 1
                                   AND LENGTH(alt_seq) > 1
                                   AND alt_seq LIKE CONCAT(ref_seq, '%')
                              THEN 'INS'

                              ELSE 'INDEL'
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
