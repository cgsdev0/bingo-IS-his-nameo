if [[ "$REQUEST_METHOD" != "POST" ]]; then
  # only allow POST to this endpoint
  return $(status_code 405)
fi

counter3=${FORM_DATA[num]}
counter4=$counter3
while [[ $counter3 -gt 0 ]]; do
  echo "<h1>Card $((counter4-counter3+1))</h1>"
echo "<table>"
echo "<tr>"
echo "<th>B</th>"
echo "<th>I</th>"
echo "<th>N</th>"
echo "<th>G</th>"
echo "<th>O</th>"
echo "</tr>"
  counter=0
  counter2=0
  while IFS= read -r line; do
    if [[ $counter -eq 0 ]]; then
      echo "<tr>"
    fi
    if [[ $counter2 -eq 12 ]]; then
        ((counter++))
        echo "<td>FREE</td>"
    fi
    echo "<td>$line</td>"

    if [[ $counter -eq 4 ]]; then
      echo "</tr>"
      counter=-1
    fi
    ((counter++))
    ((counter2++))
  done <<< "$(echo "${FORM_DATA[things]}" | shuf)"
  echo "</table>"
  ((counter3--))
done
