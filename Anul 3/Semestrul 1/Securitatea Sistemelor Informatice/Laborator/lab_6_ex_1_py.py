"""
   Implementarea unui LFSR în F2.

   Parametri:
   - c: Lista de coeficienți de feedback (c1, c2, ..., cL)
   - s0: Lista de stări inițiale (s0, s1, ..., sL-1)
   - period_length: Lungimea perioadei

   Returnează:
   - Lista de stări generate pentru o perioadă completă
   """
def lfsr_f2(c, s0, period_length):

    L = len(c)  # lungime LFSR
    state = s0.copy()  # starea initiala

    output_sequence = []  # lista pt stocarea secventei de output

    for t in range(period_length):
        # adaugam starea curente la secv de output
        output_sequence.extend(state)

        # calculam bit ul de feedback
        feedback_bit = sum(c[i] * state[(t+L-i)%L] for i in range(L))

        # actualizam starea pt urmatoarea iteratie
        state = [feedback_bit] + state[:-1]

        # calcul st+4
        # st_plus_4 = (state[1] + state[0])%2
        # adaugam starea curenta
        output_sequence.append(state[-1])

    return output_sequence


feedback_coeffs = [0, 0, 1, 1]
initial_state = [1, 0, 1, 1]
period_length = 16

output_sequence = lfsr_f2(feedback_coeffs, initial_state, period_length)

print("(t)  ", end="")
for t in range(period_length):
    print(t, end=" ")
print("\n(st) ", end="")
for bit in output_sequence[:period_length]:
    print(bit, end=" ")
