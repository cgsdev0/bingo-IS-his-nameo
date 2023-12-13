
source config.sh

htmx_page << EOF
  <h1>${PROJECT_NAME}</h1>
  <form hx-post="/bingo">
    <textarea name="things" rows=30 cols=100></textarea>
    <br />
    <input type="number" name="num" placeholder="how many?" />
    <button>bingo</button>
  </form>
EOF
