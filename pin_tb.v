`timescale 1ns/1ns

module pin_tb;
  reg b_esq_i_tb, b_dir_i_tb;
  reg [15:0] pin_vec_i_tb;
  wire w_o_tb;

  // Instanciando Pin module
  pin  U00(
    .b_esq_i(b_esq_i_tb),
    .b_dir_i(b_dir_i_tb),
    .w_o(w_o_tb),
    .pin_vec_i(pin_vec_i_tb)
  );
  
  initial begin
    // Valores inicias
    b_esq_i_tb = 0;
    b_dir_i_tb = 0;
    pin_vec_i_tb = 16'b0;

    // Monitor signals
    $monitor("Time=%0t b_esq_i=%b b_dir_i=%b w_o=%b pin_true_vec=%b", $time, b_esq_i_tb, b_dir_i_tb, w_o_tb, pin_vec_i_tb);

    #10;
    //primeira vez pin
    pin_vec_i_tb = 16'b0;
    
    // seleciona 0
    b_esq_i_tb = 1; //seleciona
    #10; 
    b_esq_i_tb = 0;
    #10;    
    
    // seleciona 1
    #10;
    b_dir_i_tb = 1; //1
    #10;
    b_dir_i_tb = 0;
    #10;
    b_esq_i_tb = 1; //seleciona
    #10;
    b_esq_i_tb = 0; 
    #10;

    // seleciona 2
    #10;
    b_dir_i_tb = 1; //1
    #10;
    b_dir_i_tb = 0;
    #10 
    b_dir_i_tb = 1; //2
    #10;
    b_dir_i_tb = 0;
    #10; 
    b_esq_i_tb = 1; //seleciona
    #10;
    b_esq_i_tb = 0; 

    // seleciona 3
    #10 
    b_dir_i_tb = 1; //1
    #10 
    b_dir_i_tb = 0;
    #10 
    b_dir_i_tb = 1; //2
    #10 
    b_dir_i_tb = 0;
    #10 
    b_dir_i_tb = 1; //3
    #10 
    b_dir_i_tb = 0;
    #10 
    b_esq_i_tb = 1; //seleciona
    #10;
    b_esq_i_tb= 0;
    #10;

    //selecionando o pin pra comparar com o que ta na memoria
    pin_vec_i_tb = 16'b0011001000010000; //3210 na memoria
    
    // seleciona 0
    b_esq_i_tb = 1; //seleciona
    #10; 
    b_esq_i_tb = 0;
    #10;    
    
    // seleciona 1
    #10;
    b_dir_i_tb = 1; //1
    #10;
    b_dir_i_tb = 0;
    #10;
    b_esq_i_tb = 1; //seleciona
    #10;
    b_esq_i_tb = 0; 
    #10;

    // seleciona 2
    #10;
    b_dir_i_tb = 1; //1
    #10;
    b_dir_i_tb = 0;
    #10 
    b_dir_i_tb = 1; //2
    #10;
    b_dir_i_tb = 0;
    #10; 
    b_esq_i_tb = 1; //seleciona
    #10;
    b_esq_i_tb = 0; 

    // seleciona 3
    #10 
    b_dir_i_tb = 1; //1
    #10 
    b_dir_i_tb = 0;
    #10 
    b_dir_i_tb = 1; //2
    #10 
    b_dir_i_tb = 0;
    #10 
    b_dir_i_tb = 1; //3
    #10 
    b_dir_i_tb = 0;
    #10 
    b_esq_i_tb = 1; //seleciona
    #10;
    b_esq_i_tb= 0;
    #10;

    
    #100 $stop; // Stop simulation after a certain time
  end
endmodule
