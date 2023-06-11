-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema projetoERP
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema projetoERP
-- -----------------------------------------------------
CREATE DATABASE projetoERP;
USE projetoERP;


CREATE TABLE Despesas (
  id_despesas INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  tipo VARCHAR(45) NOT NULL,
  valor VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_despesas)
)
ENGINE = InnoDB; 


CREATE TABLE Sexo (
  id_sexo INT NOT NULL AUTO_INCREMENT,
  tipo_sexo VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_sexo)
)
ENGINE = InnoDB; 


CREATE TABLE Vendas (
  id_Vendas INT NOT NULL AUTO_INCREMENT,
  datas DATE,
  total_venda VARCHAR(45),
  id_despesas INT NOT NULL,
  id_ItensVendas INT NOT NULL,
  PRIMARY KEY (id_Vendas),
  FOREIGN KEY (`id_despesas`) REFERENCES Despesas (`id_despesas`),
  FOREIGN KEY (`id_ItensVendas`) REFERENCES ItensVendas (`id_ItensVendas`)
)
ENGINE = InnoDB; 


CREATE TABLE ItensVendas (
  id_ItensVendas INT NOT NULL AUTO_INCREMENT,
  quantidade_vendida VARCHAR(45),
  PRIMARY KEY (id_ItensVendas)
)
ENGINE = InnoDB;


CREATE TABLE ImpostoTaxa (
  id_ImpostoTaxa INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(45),
  valor VARCHAR(45),
  PRIMARY KEY (id_ImpostoTaxa)
)
ENGINE = InnoDB;


CREATE TABLE Funcionarios (
  id_funcionario INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  cargo VARCHAR(50) NOT NULL,
  cpf VARCHAR(14) NOT NULL,
  rg VARCHAR(12) NOT NULL,
  email VARCHAR(45) NOT NULL,
  telefone VARCHAR(20) NOT NULL,
  id_despesas INT NOT NULL,
  id_Vendas INT NOT NULL,
  id_usuarios INT NOT NULL,
  id_sexo INT NOT NULL,
  PRIMARY KEY (id_funcionario),
  UNIQUE INDEX cpf_UNIQUE (CPF ASC) VISIBLE,
  UNIQUE INDEX rg_UNIQUE (RG ASC) VISIBLE,
  FOREIGN KEY (`id_despesas`) REFERENCES Despesas (`id_despesas`),
  FOREIGN KEY (`id_Vendas`) REFERENCES Vendas (`id_Vendas`),
  FOREIGN KEY (`id_usuarios`) REFERENCES Usuarios (`id_usuarios`),
  FOREIGN KEY (`id_sexo`) REFERENCES Sexo (`id_sexo`)
)
ENGINE = InnoDB;


CREATE TABLE Usuarios (
  id_usuarios INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  id_Vendas INT NOT NULL,
  id_sexo INT NOT NULL,
  PRIMARY KEY (id_usuarios),
  FOREIGN KEY (`id_Vendas`) REFERENCES Vendas (`id_Vendas`),
  FOREIGN KEY (`id_sexo`) REFERENCES Sexo (`id_sexo`)
)
ENGINE = InnoDB; 


CREATE TABLE Notas_Fiscais (
  id_Notas_Fiscais INT NOT NULL AUTO_INCREMENT,
  id_Vendas INT NOT NULL,
  id_ItensVendas INT NOT NULL,
  FOREIGN KEY (`id_Vendas`) REFERENCES Vendas (`id_Vendas`),
  FOREIGN KEY (`id_ItensVendas`) REFERENCES ItensVendas (`id_ItensVendas`),
  PRIMARY KEY (id_Notas_Fiscais)
)
ENGINE = InnoDB; 


CREATE TABLE Produtos (
  id_Produtos INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(45),
  quantidade_em_estoque VARCHAR(45) NOT NULL,
  descricao VARCHAR(45),
  preco VARCHAR(45),
  baixo_stoque VARCHAR(45),
  id_impostoTaxa INT NOT NULL,
  id_ItensVendas INT NOT NULL,
  PRIMARY KEY (id_Produtos),
  FOREIGN KEY (`id_impostoTaxa`) REFERENCES ImpostoTaxa(`id_impostoTaxa`),
  FOREIGN KEY (`id_ItensVendas`) REFERENCES ItensVendas (`id_ItensVendas`)
)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
