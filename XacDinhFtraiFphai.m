function [Ftrai, Fphai] = XacDinhFtraiFphai(UL, UR, TOL)
format long;

[U1, U2] = GiaoDiemW1VaW3B(UL, UR, TOL);

s = lambda2(U1);

if abs(s) <= TOL
    Ftrai = ChuyenUThanhF(U1);
    Fphai = ChuyenUThanhF(U2);
else
    if s < 0
        if lambda3(U2) <= lambda3(UR)
            U = Rare3(U2, UR, 0);
            Ftrai = ChuyenUThanhF(U);
            Fphai = Ftrai;
        else
            s3 = VanTocShock3(U2, UR);
            if abs(s3) <= TOL
                Ftrai = ChuyenUThanhF(U2);
                Fphai = ChuyenUThanhF(UR);
            else
                if s3 < 0
                    Ftrai = ChuyenUThanhF(UR);
                    Fphai = Ftrai;
                else
                    Ftrai = ChuyenUThanhF(U2);
                    Fphai = Ftrai;
                end
                    
            end
            
        end
    else
        if lambda1(UL) <= lambda1(U1)
            U = Rare1(UL, U1, 0);
            Ftrai = ChuyenUThanhF(U);
            Fphai = Ftrai;
        else
            s1 = VanTocShock1(UL, U1);
            if abs(s1) <= TOL
                Ftrai = ChuyenUThanhF(UL);
                Fphai = ChuyenUThanhF(U1);
            else
                if s1 > 0
                    Ftrai = ChuyenUThanhF(UL);
                    Fphai = Ftrai;
                else
                    Ftrai = ChuyenUThanhF(U1);
                    Fphai = Ftrai;
                end
                    
            end
            
        end
    end
    
end

end