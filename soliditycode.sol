// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Build the Contract
contract MovieRatings
{
    // Create a structure
    struct movies
    {
        int movieNumber;
        string MoviesName;
        int Ratings;
    }

    movies[] public moviesstore;
    address owner;
    int public movieNumber = 0;
    mapping(int => movies) public movierecords;

    modifier onlyOwner
    {
        require(owner == msg.sender);
        _;
    }
    constructor()
    {
        owner=msg.sender;
    }

    // Create a function to add
    // the new records
    function addNewRecords(int _Number,
                        string memory _MName,
                        int _ratings) public onlyOwner
    {
        // Increase the count by 1
        movieNumber = movieNumber + 1;
        moviesstore.push(movies({movieNumber: _Number, MoviesName: _MName, Ratings: _ratings}));
        movierecords[movieNumber] = movies(_Number, _MName, _ratings);
    }
}
