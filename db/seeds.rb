isaak=Author.create(name: 'Isaak Asimov', birth: '1920-01-02', death: '1992-04-06')
dan=Author.create(name: 'Dan Simmons', birth: '1948-04-04', death: '1992-04-06', nationality: 'American')

Book.create([{ title: "Foundation", author_id: isaak.id, published: 1951 },
             { title: "Foundation and Empire", author_id: isaak.id, published: 1952 },
             { title: "Hyperion", author_id: dan.id, published: 1989 },
             { title: "Endymion", author_id: dan.id, published: 1996 },
             { title: "The Rise of Endymion", author_id: dan.id, published: 1997 },])
