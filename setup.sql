DROP TABLE IF EXISTS variants;

CREATE TABLE IF NOT EXISTS variants(
    id             INT AUTO_INCREMENT PRIMARY KEY NOT NULL
   ,chromosome     VARCHAR(32) NOT NULL
   ,genomic_coord  INT UNSIGNED NOT NULL
   ,ref_allele_seq VARCHAR(256) NOT NULL
   ,alt_allele_seq VARCHAR(256) NOT NULL
   ,start_coord    INT UNSIGNED NULL
   ,end_coord      INT UNSIGNED NULL
   ,variant_type   ENUM('SNV', 'MNV', 'INS', 'DEL', 'INDEL')

   ,INDEX genomic_location (chromosome, genomic_coord, ref_allele_seq, alt_allele_seq)
);
