CREATE TABLE public.dim_tempo (
sk_tempo INTEGER NOT NULL,
nk_data DATE NOT NULL,
nr_ano INTEGER NOT NULL,
nm_trimestre CHAR(2) NOT NULL,
nr_ano_trimestre CHAR(7) NOT NULL,
nr_mes INTEGER NOT NULL,
nm_mes VARCHAR(10) NOT NULL,
nr_ano_mes CHAR(7) NOT NULL,
CONSTRAINT sk_tempo PRIMARY KEY (sk_tempo)
);




CREATE SEQUENCE public.dim_empresa_sk_empresa_seq;



CREATE TABLE public.dim_empresa (
sk_empresa INTEGER NOT NULL DEFAULT nextval('public.dim_empresa_sk_empresa_seq'),
nk_empresa VARCHAR(3) NOT NULL,
nm_empresa VARCHAR(100) NOT NULL,
nm_nacionalidade VARCHAR(11) NOT NULL,
CONSTRAINT sk_empresa PRIMARY KEY (sk_empresa)
);




ALTER SEQUENCE public.dim_empresa_sk_empresa_seq OWNED BY public.dim_empresa.sk_empresa;



CREATE SEQUENCE public.dim_aeroporto_sk_aeroporto_seq;



CREATE TABLE public.dim_aeroporto (
sk_aeroporto INTEGER NOT NULL DEFAULT nextval('public.dim_aeroporto_sk_aeroporto_seq'),
nk_aeroporto VARCHAR(4) NOT NULL,
nm_aeroporto VARCHAR(66) NOT NULL,
uf VARCHAR(2) NOT NULL,
regiao VARCHAR(20) NOT NULL,
pais VARCHAR(50) NOT NULL,
nm_continente VARCHAR(20) NOT NULL,
latitude REAL NOT NULL,
longitude REAL NOT NULL,
CONSTRAINT sk_aeroporto PRIMARY KEY (sk_aeroporto)
);




ALTER SEQUENCE public.dim_aeroporto_sk_aeroporto_seq OWNED BY public.dim_aeroporto.sk_aeroporto;



CREATE TABLE public.ft_dadosanac (
sk_tempo INTEGER NOT NULL,
sk_aeroporto_origem INTEGER NOT NULL,
sk_aeroporto_destino INTEGER NOT NULL,
sk_empresa INTEGER NOT NULL,
nm_natureza_voo BIGINT,
nm_grupo_voo BIGINT,
md_passageiros_pagos BIGINT,
md_passageiros_gratis BIGINT,
md_carga_paga_kg BIGINT,
md_carga_gratis_kg BIGINT,
md_correio_kg BIGINT,
md_correio_km BIGINT,
md_ask BIGINT,
md_rpk BIGINT,
md_atk BIGINT,
md_rtk BIGINT,
md_combustivel BIGINT,
md_distancia BIGINT,
md_decolagens BIGINT,
md_carga_gratis_km BIGINT,
md_carga_paga_km BIGINT,
md_assentos BIGINT,
md_payload BIGINT,
md_horas_voadas BIGINT,
md_bagagem_kg BIGINT
);




ALTER TABLE public.ft_dadosanac ADD CONSTRAINT dim_tempo_ft_dadosanac_fk
FOREIGN KEY (sk_tempo)
REFERENCES public.dim_tempo (sk_tempo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;



ALTER TABLE public.ft_dadosanac ADD CONSTRAINT dim_empresa_ft_dadosanac_fk
FOREIGN KEY (sk_empresa)
REFERENCES public.dim_empresa (sk_empresa)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;



ALTER TABLE public.ft_dadosanac ADD CONSTRAINT dim_aeroporto_ft_dadosanac_fk
FOREIGN KEY (sk_aeroporto_origem)
REFERENCES public.dim_aeroporto (sk_aeroporto)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;



ALTER TABLE public.ft_dadosanac ADD CONSTRAINT dim_aeroporto_ft_dadosanac_fk1
FOREIGN KEY (sk_aeroporto_destino)
REFERENCES public.dim_aeroporto (sk_aeroporto)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;