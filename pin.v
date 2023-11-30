module pin (w_o, b_esq_i, b_dir_i, pin_vec_i,pin_vec_o);

  input wire b_esq_i, b_dir_i;
  output reg w_o;
  input wire [15:0] pin_vec_i;
  output wire [15:0] pin_vec_o;
  reg [15:0] pin_true_vec;
  reg [15:0] pin_select_vec;

  integer round;
  integer index1 = 0;
  integer index2 = 0;
  // Definir primeiro pin e guardar na memoria
  always @(b_dir_i or b_esq_i or pin_vec_i) begin
    if (pin_vec_i == 16'b0) begin
      for (round = 0; round < 4; round = round + 1) begin
        index1 = 0;
        if (b_dir_i == 1) index1 = index1 + 1;
        if (index1 == 10) index1 = 0;
        if (b_esq_i == 1) begin
          case (index1)
            0: pin_true_vec[round * 4 +: 4] = 4'b0000;
            1: pin_true_vec[round * 4 +: 4] = 4'b0001;
            2: pin_true_vec[round * 4 +: 4] = 4'b0010;
            3: pin_true_vec[round * 4 +: 4] = 4'b0011;
            4: pin_true_vec[round * 4 +: 4] = 4'b0100;
            5: pin_true_vec[round * 4 +: 4] = 4'b0101;
            6: pin_true_vec[round * 4 +: 4] = 4'b0110;
            7: pin_true_vec[round * 4 +: 4] = 4'b0111;
            8: pin_true_vec[round * 4 +: 4] = 4'b1000;
            9: pin_true_vec[round * 4 +: 4] = 4'b1001;
          endcase
        end
      end
    pin_vec_o <= pin_true_vec;
	 end
	 
  end

  // Comparar pin selecionado com o armazenado na memoria
  always @(b_dir_i or b_esq_i) begin
    for (round = 0; round < 4; round = round + 1) begin
      index2 = 0;
      if (b_dir_i == 1) index2 = index2+ 1;
      if (index2 == 10) index2 = 0;
      if (b_esq_i == 1) begin
        case (index2)
          0: pin_select_vec[round * 4 +: 4] = 4'b0000;
          1: pin_select_vec[round * 4 +: 4] = 4'b0001;
          2: pin_select_vec[round * 4 +: 4] = 4'b0010;
          3: pin_select_vec[round * 4 +: 4] = 4'b0011;
          4: pin_select_vec[round * 4 +: 4] = 4'b0100;
          5: pin_select_vec[round * 4 +: 4] = 4'b0101;
          6: pin_select_vec[round * 4 +: 4] = 4'b0110;
          7: pin_select_vec[round * 4 +: 4] = 4'b0111;
          8: pin_select_vec[round * 4 +: 4] = 4'b1000;
          9: pin_select_vec[round * 4 +: 4] = 4'b1001;
        endcase
      end
    end

    // Sinalizar que o acesso foi liberado
    if (pin_select_vec == pin_true_vec)
      w_o = 1'b1;
    else
      w_o = 1'b0;
  end

endmodule
