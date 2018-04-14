INSERT INTO genomics.variants (chromosome, genomic_coord, ref_allele_seq, alt_allele_seq)
VALUES  ( '1',     50,     'G',   'GAG') -- INS
       ,( '1',    500,     'C',     'T') -- SNV
       ,( '1',  28350,    'TG',   'AAG') -- INDEL
       ,( '2', 128030,   'ACC',     'A') -- DEL
       ,( '2',    328,  'CGCG',  'TTTT') -- MNV
;
