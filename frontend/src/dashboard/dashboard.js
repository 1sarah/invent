import React from 'react';
import { useQuery } from '@apollo/client';
import { GET_PRODUCTS } from '../queries/product';
import { Table } from 'react-bootstrap';

function Dashboard() {
    const { loading, error, data } = useQuery(GET_PRODUCTS);
    console.log('',data)
    if (loading) return <p>Loading...</p>;
    if (error) return <p>Error :(</p>;


    return (
        <div className="dashboard">
            <h2>Products Dashboard</h2>
            <table>
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Price</th>
                    </tr>
                </thead>
                <tbody>
                    {data.getAllProducts.product.map((product) => (
                        <tr key={product.id}>
                            <td>{product.name}</td>
                            <td>{product.price}</td>
                        </tr>
                    ))}
                </tbody>
            </table>
        </div>
    );
}

export default Dashboard;