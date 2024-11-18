// Select the "Search" link and the search form container
const searchLink = document.getElementById('searchLink');
const searchFormContainer = document.getElementById('searchFormContainer');

// Add event listener to display the search form on click
searchLink.addEventListener('click', () => {
  searchFormContainer.innerHTML = `
    <h2>Search</h2>
    <form id="searchForm">
      <label for="searchQuery">Enter Search Query</label>
      <input type="text" id="searchQuery" name="searchQuery" placeholder="What are you looking for?" required>
      <label for="searchCategory">Category</label>
      <select id="searchCategory" name="searchCategory">
        <option value="Songs">Songs</option>
        <option value="Albums">Albums</option>
        <option value="Artists">Artists</option>
        <option value="Playlists">Playlists</option>
        <option value="Genres">Genres</option>
      </select>
      <button type="submit">Search</button>
    </form>
  `;

  // Show the search form
  searchFormContainer.style.display = 'block';

  // Handle form submission
  const searchForm = document.getElementById('searchForm');
  searchForm.addEventListener('submit', (e) => {
    e.preventDefault();
    const query = document.getElementById('searchQuery').value;
    const category = document.getElementById('searchCategory').value;
    alert(`Searching for "${query}" in "${category}"`);
    // Add logic for search processing here
  });
});
