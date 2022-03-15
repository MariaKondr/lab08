model lab08f
  parameter Real M01 = 3.6;//оборотные средства компании 1 в начальный момент времени
  parameter Real M02 = 2.9;//оборотные средства компании 2 в начальный момент времени
  parameter Real p_cr = 32;//критическая стоимость продукта
  parameter Real N = 33;//число потребителей производимого продукта
  parameter Real q = 1;//максимальная потребность одного человека в продукте в единицу времени
  parameter Real tau1 = 25;//длительность производственного цикла фирмы 1
  parameter Real tau2 = 15;//длительность производственного цикла фирмы 1
  parameter Real p1 = 8;//себестоимость продукта у фирмы 1
  parameter Real p2 = 10.5;//себестоимость продукта у фирмы 2
  
  parameter Real a1 = p_cr/((tau1^2)*(p1^2)*N*q);
  parameter Real a2 = p_cr/((tau2^2)*(p2^2)*N*q);
  parameter Real b = p_cr/((tau1^2)*(p1^2)*(tau2^2)*(p2^2)*N*q);
  parameter Real c1 = (p_cr-p1)/(tau1*p1);
  parameter Real c2 = (p_cr-p2)/(tau2*p2);
  
  Real M1(start=M01);
  Real M2(start=M02);
  Real theta;
equation
  time = c1*theta;
  der(M1)=M1 - (b/c1)*M1*M2 - (a1/c1)*(M1^2);
  der(M2)=(c2/c1)*M2 - (b/c1)*M1*M2 - (a2/c1)*(M2^2);
end lab08f;
