--Criando a table do cliente
  create table tb_customer(
  id_customer integer primary key,
  nm_customer varchar2(60)not null,
  cpf_cnpj    number(14)not null
)


-- Criando a table do endereço
  create table tipo_end(
  cd_end_tipo char(1) primary key,
  ds_address_type varchar2(60)not null
)

--Criando a tabela do Endereço do Cliente
  create table tb_customer_adress(
  id_customer integer,
  cd_end_tipo char(1),
  street  varchar2(60),
  lot integer,
  zip_cod    varchar2(60),
  
  constraint tb_customer_id_customer_fk foreign key (id_customer) references tb_customer(id_customer),
  constraint tipo_end_cd_end_tipo_fk foreign key (cd_end_tipo) references tipo_end(cd_end_tipo) 
  )
  
    
  
  --Primeiro vou criar uma sequncia para ele ir populando com auto_increment o ID do cliente.
     create sequence id_costumer_seq;
  
  
  --Com a sequencia criada, vou popular a tabela do cliente, usando autoincrement no ID  
     insert into tb_customer(id_customer,nm_customer,cpf_cnpj)
     values (id_costumer_seq.nextval,'Joãozinho Silva',88877766655);
     
  --Vamos inserir na tabela de endereço, os seus valores, o nome foi alerado de dm_address_type
  --para tipo_end, pois o tamanho da FK na tabela tb_customer_address fica muito extenso e da erro no sql.

    insert into tipo_end(cd_end_tipo,ds_address_type) 
    values ('R','Endereço Residencial');
    
    insert into tipo_end(cd_end_tipo,ds_address_type)
    values ('C','Endereço Comercial');
    
    insert into tipo_end(cd_end_tipo,ds_address_type)
    values ('O','Outros');
    
    
   -- Agora vamos inserir os dados na tabela cliente-endereço, colocando o id do joao, e o mesmo procedimento anterior para as residencias.
    insert into tb_customer_adress(id_customer, cd_end_tipo, street,lot,zip_cod)
    values(1, 'R', ' Rua das Flores',1,'01234-567');
    
    insert into tb_customer_adress(id_customer, cd_end_tipo, street,lot,zip_cod)
    values(1, 'C', ' Rua das Pedras 100',200,'01234-567');

 


-- Para excluir um cliente do banco de dados;
   delete from tb_customer where cpf_cnpj=88877766655;