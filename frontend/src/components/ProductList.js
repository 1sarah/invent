import React from 'react';
import { useQuery } from '@apollo/client';
import { GET_PRODUCTS } from '../queries';
import { Table } from 'react-bootstrap';

function ProductList() {
  const { loading, error, data } = useQuery(GET_PRODUCTS);
   console.log(data)
  if (loading) return <p>Loading...</p>;
  if (error) return <p>Error :(</p>;

  return (
    <div>
      <h1>Product List</h1>
      <Table striped bordered hover>
        <thead>
          <tr>
            <th>Name</th>
            <th>Price</th>
            <th>Quantity</th>
          </tr>
        </thead>
        <tbody>
            
          {data.getAllProducts.edges.map(({ node }) => (
            <tr key={node.id}>
              <td>{node.name}</td>
              <td>{node.price}</td>
              <td>{node.quantity}</td>
            </tr>
          ))}
        </tbody>
      </Table>
    </div>
  );
}

export default ProductList;
