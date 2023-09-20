function V = ChuyenUThanhUnga(U, n)
format long;
V = U;
V(2) = n(1)*U(2) + n(2)*U(3);
V(3) = -n(2)*U(2) + n(1)*U(3);
end